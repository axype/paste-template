local serde = require("@lune/serde")

local base64 = require("./base64")

local zstd = {}

function zstd.zbase64(data: buffer | string): buffer
	return base64.encode(buffer.fromstring(serde.compress("zstd", data, 19)))
end

return zstd
