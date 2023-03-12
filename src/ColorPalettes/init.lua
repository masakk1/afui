local colortype = require(script["color.type"])
export type Palette = colortype.Palette

local CURRENT_CUSTOM_PALETTE_NAME = "Nord"
local PALETTE_COLORS: Palette = require(script:FindFirstChild(CURRENT_CUSTOM_PALETTE_NAME))

return PALETTE_COLORS
