local process = require("@lune/process")
local stdio = require("@lune/stdio")
local fs = require("@lune/fs")
local compiler = require("./compiler")
local zstd = require("./packages/zstd")

local isDev = table.find(process.args, "dev") ~= nil
local dluaConfig = isDev and ".darklua.dev.json" or ".darklua.json"

local function cprint(color: stdio.Color, ...)
	stdio.write(stdio.color(color))
	print(...)
	stdio.write(stdio.color("reset"))
end

local function spawnAssert(...)
	local proc = process.create(...)

	if not proc:status().ok then
		error(proc.stderr)
	end

	return proc
end

local function build()
	if not fs.isDir("output") then
		fs.writeDir("output")
	end

	-- Client
	cprint("purple", "Building client...")

	local clientEntry = "src/client/init"
	local useLua = fs.isFile(clientEntry .. ".lua")
	local useLuau = fs.isFile(clientEntry .. ".luau")

	if not useLua and not useLuau then
		cprint("red", "define a client init.lua or .luau file!")
		return
	end

	cprint("purple", `Using lua{useLuau and "u" or " 5.1"} compiler for client`)
	spawnAssert("darklua", {
		"process",
		"-c",
		dluaConfig,
		useLuau and (clientEntry .. ".luau") or (clientEntry .. ".lua"),
		"output/client.txt",
	})

	fs.writeFile("output/client_compressed.txt", zstd.zbase64(compiler(fs.readFile("output/client.txt"), useLuau)))

	cprint("green", "Built client!")

	-- Server
	cprint("cyan", "Building server...")
	spawnAssert("darklua", { "process", "-c", dluaConfig, "src/server/init.luau", "output/server.luau" })
	cprint("green", "Built server!")

	-- Rojo
	cprint("white", "Updating Rojo folder...")
	if not fs.isDir("output_rojo") then
		fs.writeDir("output_rojo")
	end

	fs.writeFile("output_rojo/source.luau", `return function(...)\n{fs.readFile("output/server.luau")}\nend`)

	-- Final
	cprint("white", "Paste source is available at ./output/server.luau")
end

build()
