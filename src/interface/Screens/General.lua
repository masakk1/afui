--== Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local fusion = require(ReplicatedStorage.Modules.Fusion)

local New = fusion.New

local screen = New "ScreenGui" {
    Name = "ScreenGui";
    IgnoreGuiInset = true;
}

return screen