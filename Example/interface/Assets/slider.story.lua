local ReplicatedStorage = game:GetService("ReplicatedStorage")
local afui = require(ReplicatedStorage.Modules.afui)

return function(target)
	--local loop = true

	local slider = require(afui.Objects.Slider)
	slider.Parent = target

	return function()
		slider:Destroy()
	end
end
