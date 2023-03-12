local Packages = script.Parent.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New

local empty_UDim = UDim.new(0, 0)

return function(props)
	return New("UIPadding") {
		PaddingBottom = props.bottom or empty_UDim,
		PaddingLeft = props.left or empty_UDim,
		PaddingRight = props.right or empty_UDim,
		PaddingTop = props.top or empty_UDim,
	}
end
