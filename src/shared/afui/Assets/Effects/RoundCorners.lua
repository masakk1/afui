local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Modules
local Fusion = require(Modules.Fusion)

local New = Fusion.New

return function(props)
    return New "UICorner" {
        CornerRadius = props.radius or UDim.new(0, 7)
    }
end