--== Variables ==--
local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Fusion = require(ReplicatedStorage.Modules.Fusion)

local Signal = require(ReplicatedStorage.Modules.Signal)

-- input type
export type InputType = {
	UserInputType: Enum.UserInputType;
	KeyCode: Enum.KeyCode;
}
--== Running ==--
local InputControl = {}

function InputControl.Hover(inst: GuiObject): (Signal.Signal<boolean>)
	local HoveringChanged = Signal.new()

	inst.MouseEnter:Connect(function()
		HoveringChanged:Fire(true)
	end)
	inst.MouseLeave:Connect(function()
		HoveringChanged:Fire(false)
	end)

	return HoveringChanged
end

-- destroyingSignal is used to cleanup
function InputControl.Tap(inst: GuiObject, event_input: InputType, use_entered: boolean): (Signal.Signal<boolean>, Signal.Signal)
	local TapSignal = Signal.new()
	
	local entered_on_frame: boolean = false
	local connections = {}
	
	if use_entered then
		local HoveringChanged = InputControl.Hover(inst)
		table.insert(connections, HoveringChanged:Connect(function(value)
			entered_on_frame = value
		end))
	end

	--mouse down
	table.insert(connections, UIS.InputBegan:Connect(function(input: InputObject, gpe:boolean)
		if gpe then return end
		--check if userinputtype matches
		if input.UserInputType == event_input.UserInputType then
			--if there is keycode (aka we are using keys) & it doesn't match, then return
			if (event_input.KeyCode) and (input.KeyCode ~= event_input.KeyCode) then return end
			if entered_on_frame then return end -- this is as long as we entered the frame (entered on frame is true if not using it)

			TapSignal:Fire(true)
		end
	end))
	--mouse up
	table.insert(connections, UIS.InputEnded:Connect(function(input: InputObject, gpe:boolean)
		if gpe then return end
		--check if userinputtype matches
		if input.UserInputType == event_input.UserInputType then
			--if there is keycode (aka we are using keys) & it doesn't match, then return
			if (event_input.KeyCode) and (input.KeyCode ~= event_input.KeyCode) then return end

			TapSignal:Fire(false)
		end
	end))
	local destryoingSignal = Signal.new()
	destryoingSignal:Once(function()
		for _, conn in ipairs(connections) do
			conn:Disconnect()
		end
		destryoingSignal:Destroy()
	end)

	return TapSignal, destryoingSignal
end

return InputControl