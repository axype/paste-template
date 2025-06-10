--!nocheck

return {
	client = buffer.tostring(
		game:GetService("HttpService")
			:JSONDecode('{"m": null, "t": "buffer", "zbase64": "' .. require("@output/client_compressed.txt") .. '"}')
	),
}
