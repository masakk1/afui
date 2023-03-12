local Packages = script.Parent.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New

return function(props)
	return New("UICorner") {
		CornerRadius = props.radius or UDim.new(0, 7),
	}
end
