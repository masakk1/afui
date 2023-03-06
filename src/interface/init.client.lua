--!strict
--== Variables ==--
local Assets = script.Assets
local Screens = script.Screens

local player = game.Players.LocalPlayer
local PlayerGui = player.PlayerGui

local screen_list: {[number]: ScreenGui} = {}

--== Running ==--
for _, asset in pairs(Screens:GetChildren()) do
    local screen = require(asset)
    screen.Parent = PlayerGui
    screen_list[screen.Name] = screen
end
for _, asset in pairs(Assets:GetChildren()) do
    if asset.Name:match("%.story$") then continue end

    local object, screen_name = table.unpack(require(asset))
    object.Parent = screen_list[screen_name]
end