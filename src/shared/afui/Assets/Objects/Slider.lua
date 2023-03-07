--!strict
--== Variables ==--
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Fusion = require(ReplicatedStorage.Modules.Fusion)

local New = Fusion.New

--== Running ==--
local Slider = {}
Slider.__index = Slider

--Define the constructor for Slider
function Slider.New(Body: GuiObject, Handle: GuiObject?, ProgressBar: GuiObject?)
    local self = setmetatable({}, Slider)

    self.Body = Body
    self.Handle = Handle or Body.Handle
    self.ProgressBar = ProgressBar or Body.ProgressBar

    return self
end

--Updates the values of Slider
function Slider:Update(percent:number): ()
    -- update handle
    print("update handle by "..percent)

    -- update progress bar
    print("update progress bar by "..percent)

end

--Cleans up Slider
function Slider:Destroy(): ()
    self.Body:Destroy()
    self.Handle:Destroy()
    self.ProgressBar:Destroy()
end

return Slider.New