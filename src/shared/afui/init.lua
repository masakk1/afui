--== Variables ==--
local Assets = script.Assets
local Utils = script.Utils

local Effects = Assets.Effects
local Objects = Assets.Objects

--== Running ==--
local afui = {}

afui.Effects = {
    RoundCorners = require(Effects.RoundCorners);
    Padding = require(Effects.Padding)
}

afui.Objects = {
    Slider = require(Objects.Slider);
}

return afui