local Packages = script.Parent.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New

return function(props)
	return New("UIStroke") {
		ApplyStrokeMode = props.ApplyStrokeMode or Enum.ApplyStrokeMode.Border,
		Color = props.color or Color3.new(),
		LineJoinMode = props.LineJoinMode or Enum.LineJoinMode.Round,
		Thickness = props.thickness or 10,
		Transparency = props.transparency,
	}
end
