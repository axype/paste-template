--!nolint
--!nocheck
local runArgs: { string } = {} -- add any run args you want
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local owner = nil
if not runService:IsRunMode() then
	owner = players:GetPlayers()[0] or players.PlayerAdded:Wait()
end
local source = script.Parent:FindFirstChild("source")
assert(source, "Please build the project first, then play.")
setfenv(require(source), require(script.Parent.axypeEnvMock)(owner))(unpack(runArgs))
