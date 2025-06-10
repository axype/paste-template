--[=[
    server/init.luau

    To require modules under the `shared` folder use the `@shared` prefix inside `require()`
    Do the same for modules under `server` too!
    ```
        local sharedModule = require("@shared/module")
    ```

    To access the bundled client source bytecode, require the `bytecode` module under `server`:
    ```
        local clientSource = require("@server/bytecode").client
    ```
]=]

local sharedModule = require("@shared/module")

print("Hello world, from server!")
sharedModule()

-- NLS example with the bundled bytecode
local clientBytecode = require("@server/bytecode").client
local function playerAdded(player: Player)
	NLS(clientBytecode, player:WaitForChild("PlayerGui"))
end

for _, v in next, game:GetService("Players"):GetPlayers() do
	task.spawn(playerAdded, v)
end
game:GetService("Players").PlayerAdded:Connect(playerAdded)
