local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Modules
local Fusion = require(Modules.Fusion)

local New = Fusion.New

return function(radius:UDim)
    return New "UICorner" {
        CornerRadius = radius or UDim.new(1, 0)
    }
end