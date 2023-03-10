--== Variables ==--
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Fusion = require(ReplicatedStorage.Modules.Fusion)
local Common = ReplicatedStorage.Common

local palette = require(Common.ColorPalettes)
local fx = require(Common.afui.Assets.Effects)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Computed = Fusion.Computed
local OnEvent = Fusion.OnEvent
local Observer = Fusion.Observer
local Cleanup = Fusion.Cleanup
local Spring = Fusion.Spring

--== Values ==--
local Interface = Value()

-- constants
local STROKE_HOLDING_THICKNESS = 7
local HANDLE_HOVERING_SIZE = UDim2.fromOffset(20, 20)
local HANDLE_SIZE = UDim2.fromOffset(15, 15)
local PROGRESS_BAR_HEIGHT = 10
local SPRING_SPEED = 50
local SPRING_DAMP = 1

-- fusion values
local mouse_hovering = Value(false)
local mouse_down = Value(false)
local mouse_pos = Value(Vector2.zero)

local slided_amount = Value(.5)

local function update_mouse_down()
    mouse_down:set( (mouse_down:get() and mouse_hovering:get()) )
end
local function update_slided_amount()
    if not mouse_down:get() then return end

    local _interface = Interface:get()
    local size = _interface.Shadow.AbsoluteSize
    local pos = _interface.Shadow.AbsolutePosition
    slided_amount:set( (mouse_pos:get().X - pos.X) / size.X )
end

local mouse_down_changed = Observer(mouse_down):onChange(update_mouse_down)
local mouse_hovering_changed = Observer(mouse_hovering):onChange(update_mouse_down)
local mouse_pos_changed = Observer(mouse_pos):onChange(update_slided_amount)

local stroke_size = Computed(function()
    return if mouse_down:get() and mouse_hovering:get() then STROKE_HOLDING_THICKNESS else 0
end)
local handle_size = Computed(function()
    return if mouse_hovering:get() then HANDLE_HOVERING_SIZE else  HANDLE_SIZE
end)
local progress_bar_size = Computed(function()
    return UDim2.new( slided_amount:get(), 0, 0, PROGRESS_BAR_HEIGHT )
end)
local handle_pos = Computed(function()
    return UDim2.fromScale( slided_amount:get(), 0.5 )
end)

--== Components ==--
local function handle(_)
    return New "Frame" {
        Name = "Handle";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = Spring(handle_size, SPRING_SPEED, SPRING_DAMP);
        Position = Spring(handle_pos, SPRING_SPEED, SPRING_DAMP);

        BackgroundColor3 = palette.white1;
        ZIndex = 2;

        [Children] = {
            fx.RoundCorners{ radius = UDim.new(1, 0) };
            fx.Stroke { 
                thickness = Spring(stroke_size, SPRING_SPEED, SPRING_DAMP), 
                color = palette.gray5;
                transparency = 0.3
            };
        };
    }
end
local function progress_bar(_)
    return New "Frame" {
        Name = "ProgressBar";
        AnchorPoint = Vector2.new(0, 0.5);
        Size = Spring(progress_bar_size, SPRING_SPEED, SPRING_DAMP);
        Position = UDim2.fromScale(0, .5);
        ZIndex = 1;
        BackgroundColor3 = palette.accent2;

        [Children] = {
            fx.RoundCorners { radius = UDim.new(1, 0) }
        }
    }
end
local function bar_shadow(_)
    return New "Frame" {
        Name = "Shadow";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = UDim2.new(1, 0, 0, 10);
        Position = UDim2.fromScale(.5, .5);
        ZIndex = -1;
        BackgroundColor3 = palette.black1;

        [Children] = {
            fx.RoundCorners { radius = UDim.new(1, 0) }
        }
    }
end
local function input_area(_) --All input events here
    return New "TextButton" {
        Name = "InputArea";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = UDim2.new(1, 40, 0, 30);
        Position = UDim2.fromScale(.5, .5);
        ZIndex = 10;
        BackgroundTransparency = 1;

        [OnEvent "MouseButton1Down"] = function(x, y)
            mouse_down:set(true)
            mouse_pos:set(Vector2.new(x, y), true)

        end;
        [OnEvent "MouseButton1Up"] = function(x, y)
            mouse_down:set(false)
        end;
        [OnEvent "MouseEnter"] = function()
            mouse_hovering:set(true)
        end;
        [OnEvent "MouseLeave"] = function()
            mouse_hovering:set(false)
        end;
        [OnEvent "MouseMoved"] = function(x, y)
            mouse_pos:set(Vector2.new(x, y))
        end;
    }
end
local function output_value(_)
    return New "NumberValue" {
        Name = "Output";
        Value = slided_amount
    }
end

--== Running ==--
Interface:set( New "Frame" { --Main
    AnchorPoint = Vector2.one*.5;
    Position = UDim2.fromScale(.5, .5);
    Size = UDim2.fromOffset(400, 50);

    BackgroundTransparency = 0;
    BackgroundColor3 = palette.black2;

    [Children] = {
        handle {};
        progress_bar {};
        bar_shadow {};
        input_area {};

        output_value {};

        fx.RoundCorners { radius = UDim.new(0, 10) };
        fx.Padding { left = UDim.new(0, 20), right = UDim.new(0, 20) };
    };
    [Cleanup] = {mouse_down_changed, mouse_hovering_changed, mouse_pos_changed}
})

--== Behaviour ==--
return Interface:get()