--!strict
--== Variables ==--
local PolicyService = game:GetService('PolicyService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Fusion = require(ReplicatedStorage.Modules.Fusion)
local Signal = require(ReplicatedStorage.Modules.Signal)

local Value = Fusion.Value
local New = Fusion.New

--== Running ==--
local Slider = {}
Slider.__index = Slider

local function Update(self)
    local percent = self.slidedAmount:get()

    -- update handle
    local goal_pos: Vector2 = self.bar_size * percent  -- px
    if self.isVertical then
        self.Handle.Position = UDim2.new( self.handle_pos.X, UDim.new(0, goal_pos.Y) )
        
    else
        self.Handle.Position = UDim2.new( UDim.new(0, goal_pos.X), self.handle_pos.Y )

    end

    -- update progress bar
    local goal_size:Vector2 = self.bar_size * percent
    if self.isVertical then
        self.ProgressBar.Size = UDim2.new( UDim.new( 0, self.bar_size.X ), UDim.new(0, goal_pos.Y) )

    else
        self.ProgressBar.Size = UDim2.new( UDim.new(0, goal_pos.X), UDim.new( 0, self.bar_size.Y ) )
        
    end
end

--Define the constructor for Slider
function Slider.New(Body: GuiObject, slidedAmount, isVertical: boolean?)
    print("i tried")
    local t = {}
    t.Body = Body

    t.slided_amount = slidedAmount

    t.Handle = Body.Handle
    t.handle_pos = t.Handle.Position

    t.ProgressBar = Body.ProgressBar
    t.bar_pos = t.ProgressBar.Position
    t.bar_size = t.ProgressBar.AbsoluteSize

    t.isVertical = isVertical or false

    t.connections = {}

    print("i went throug the table")
    local self = setmetatable(t, Slider)
    Update(self)

    print("i went through the metatable")
    return self
end

--Cleans up Slider
function Slider:Destroy(): ()
    self.Body:Destroy()
    self.Handle:Destroy()
    self.ProgressBar:Destroy()

    for _, conn: Signal.Signal in pairs(self.connections) do
        conn:Disconnect()
    end
end

return Slider.New