local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Modules
local Fusion = require(Modules.Fusion)

local New = Fusion.New

local empty_UDim = UDim.new(0,0)

return function(left:UDim, right:UDim, top:UDim, bottom:UDim)
    return New "UIPadding" {
        PaddingBottom = bottom  or empty_UDim;
        PaddingLeft =   left    or empty_UDim;
        PaddingRight =  right   or empty_UDim;
        PaddingTop =    top     or empty_UDim;
    }
end