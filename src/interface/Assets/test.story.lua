return function(target)
	local self = require(script.Parent.test)
	self.interface.Parent = target

	return function()
		self.interface:Destroy()
	end
end
