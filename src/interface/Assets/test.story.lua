return function(target)
	local counter = 0

	local instance = table.unpack(require(script.Parent.test))
	instance.Parent = target

	return function()
		instance:Destroy()
	end
end