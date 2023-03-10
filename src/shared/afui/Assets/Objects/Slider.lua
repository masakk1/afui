--== Variables ==--
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Fusion = require(ReplicatedStorage.Modules.Fusion)
local afui_folders = ReplicatedStorage.Common.afui

local fx = require(afui_folders.Assets.Effects)

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
local function update_slider_pos()
    if not mouse_down:get() then return end

    local _interface = Interface:get()
    local size = _interface.Shadow.AbsoluteSize
    local pos = _interface.Shadow.AbsolutePosition
    slided_amount:set( (mouse_pos:get().X - pos.X) / size.X )
end

local mouse_down_changed = Observer(mouse_down):onChange(update_mouse_down)
local mouse_hovering_changed = Observer(mouse_hovering):onChange(update_mouse_down)
local mouse_pos_changed = Observer(mouse_pos):onChange(update_slider_pos)

local stroke_size = Computed(function()
    return if mouse_down:get() and mouse_hovering:get() then STROKE_HOLDING_THICKNESS else 0
end)
local handle_size = Computed(function()
    return if mouse_hovering:get() then HANDLE_HOVERING_SIZE else  HANDLE_SIZE
end)

--== Components ==--
local function uistroke()
    return New "UIStroke" {
        Name = "Stroke";
        Thickness = Spring(stroke_size, SPRING_SPEED, SPRING_DAMP);
        Color = Color3.new(0.713725, 0.725490, 0.725490);
    }
end
local function handle()
    return New "Frame" {
        Name = "Handle";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = Spring(handle_size, SPRING_SPEED, SPRING_DAMP);
        Position = UDim2.fromScale(1,0.5);

        BackgroundColor3 = Color3.new(0.870588, 0.890196, 0.894117);
        ZIndex = 2;

        [Children] = {
            fx.RoundCorners{ radius = UDim.new(1, 0) };
            uistroke();
        };
    }
end
local function progress_bar()
    return New "Frame" {
        Name = "ProgressBar";
        AnchorPoint = Vector2.new(0, 0.5);
        Size = UDim2.new(1, 0, 0, 10);
        Position = UDim2.fromScale(0, .5);
        ZIndex = 1;
        BackgroundColor3 = Color3.new(0.219607, 0.407843, 0.501960);

        [Children] = {
            fx.RoundCorners { radius = UDim.new(1, 0) }
        }
    }
end
local function bar_shadow()
    return New "Frame" {
        Name = "Shadow";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = UDim2.new(1, 0, 0, 10);
        Position = UDim2.fromScale(.5, .5);
        ZIndex = -1;
        BackgroundColor3 = Color3.new(0.101960, 0.117647, 0.125490);

        [Children] = {
            fx.RoundCorners { radius = UDim.new(1, 0) }
        }
    }
end
local function input_area() --All input events here
    return New "TextButton" {
        Name = "InputArea";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = UDim2.new(1, 40, 0, 30);
        Position = UDim2.fromScale(.5, .5);
        ZIndex = 10;
        BackgroundTransparency = 1;

        [OnEvent "MouseButton1Down"] = function()
            mouse_down:set(true)
        end;
        [OnEvent "MouseButton1Up"] = function() 
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

--== Running ==--
Interface:set( New "Frame" { --Main
    AnchorPoint = Vector2.one*.5;
    Position = UDim2.fromScale(.5, .5);
    Size = UDim2.fromOffset(400, 50);

    BackgroundTransparency = 0;
    BackgroundColor3 = Color3.new(0.176470, 0.203921, 0.239215);

    [Children] = {
        handle();
        progress_bar();
        bar_shadow();
        input_area();

        fx.RoundCorners{ radius = UDim.new(0, 10) };
        fx.Padding { left = UDim.new(0, 20), right = UDim.new(0, 20) };
    };
    [Cleanup] = {mouse_down_changed, mouse_hovering_changed, mouse_pos_changed}
})

--== Behaviour ==--
return Interface:get()