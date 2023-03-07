--!strict
--== Variables ==--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Modules.Fusion)
local afui = require(ReplicatedStorage.Common.afui)

local New = Fusion.New
local Children = Fusion.Children
--local fx = afui.Effects

--== Running ==--
local Main = New "TextLabel" {
    Name = "test";
    AnchorPoint = Vector2.one*.5;
    Size = UDim2.fromOffset(200, 50);
    Position = UDim2.fromScale(.5, .5);
    BackgroundColor3 = Color3.new(0.101960, 0.101960, 0.105882);


    Text = "Test";
    TextColor3 = Color3.new(1, 1, 1);
    TextScaled = true;

    [Children] = {
        --fx.RoundCorners( UDim.new(0,10) )
    }
}

return {Main, "ScreenGui"}