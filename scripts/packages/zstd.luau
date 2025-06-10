local process = require("@lune/process")
local fs = require("@lune/fs")

local base64 = require("./base64")

local hasCLI = pcall(process.spawn, "zstd", { "-h" })

local zstd = {}
zstd.isEnabled = hasCLI

function zstd.compress(path: string): (boolean, string?)
	if not zstd.isEnabled then
		return false
	end

	local outputFile = path .. ".zst"
	if fs.isFile(outputFile) then
		fs.removeFile(outputFile)
	end

	local cmd = process.spawn("zstd", { "-19", path })
	if not cmd.ok then
		return false
	end

	local compressed = fs.readFile(outputFile)
	fs.removeFile(outputFile)
	return true, compressed
end

function zstd.zbase64(path: string): (boolean, string?)
	local success, raw = zstd.compress(path)

	if not success or not raw then
		return success, raw
	end

	return true, buffer.tostring(base64.encode(buffer.fromstring(raw)))
end

return zstd
