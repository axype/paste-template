--!nocheck

local luau = require("@lune/luau")
local yueliang = require("@self/yueliang")

local function compileU(code)
	return luau.compile(code, {
		optimizationLevel = 1,
		coverageLevel = 0,
		debugLevel = 1,
	})
end

local function compile51(code)
	return yueliang(code, "src")
end

return function(code, useLuau): string
	local targetCompiler = useLuau and compileU or compile51
	return targetCompiler(code)
end
