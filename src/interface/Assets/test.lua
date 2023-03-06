--== Variables ==--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local fusion = require(ReplicatedStorage.Modules.fusion)

local New = fusion.New

--== Running ==--
local Main = New "Frame" {
    Name = "test";
    BackgroundColor3 = Color3.new(0.725490, 0.388235, 0.192156);
    Size = UDim2.fromOffset(100, 100);
}

return {Main, "ScreenGui"} 