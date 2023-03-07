--== Variables ==--
local MessagingService = game:GetService('MessagingService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Fusion = require(ReplicatedStorage.Modules.Fusion)
local afui = require(ReplicatedStorage.Common.afui)

local fx = afui.Effects
local obj = afui.Objects

local New = Fusion.New
local Children = Fusion.Children

--== Components ==--
local function handle()
    return New "Frame" {
        Name = "Handle";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = UDim2.fromOffset(20, 20);
        Position = UDim2.fromScale(.5, .5);

        BackgroundColor3 = Color3.new(0.870588, 0.890196, 0.894117);
        ZIndex = 2;

        [Children] = {
            fx.RoundCorners( UDim.new(1, 0) )
        }
    }
end
local function progress_bar()
    return New "Frame" {
        Name = "ProgressBar";
        AnchorPoint = Vector2.new(0.5, 0.5);
        Size = UDim2.new(1, 0, 0, 10);
        Position = UDim2.fromScale(.5, .5);

        BackgroundColor3 = Color3.new(0.101960, 0.117647, 0.125490);

        [Children] = {
            fx.RoundCorners( UDim.new(1, 0) )
        }
    }
end

--== Running ==--
local Interface = New "Frame" {
    AnchorPoint = Vector2.one*.5;
    Position = UDim2.fromScale(.5, .5);
    Size = UDim2.fromOffset(400, 50);

    BackgroundTransparency = 0;
    BackgroundColor3 = Color3.new(0.176470, 0.203921, 0.239215);

    [Children] = {
        handle();
        progress_bar();
        fx.RoundCorners( UDim.new(0, 10) );
        fx.Padding(UDim.new(0, 20), UDim.new(0, 20));

    }
}

local Slider = obj.Slider(Interface)

return Slider