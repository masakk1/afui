-- source: www.palettetheme.com
-- starred (*) are not provided by the source.
local colortype = require(script.Parent["color.type"])

local palette = {}

palette.black1 = Color3.fromHex("141619")
palette.black2 = Color3.fromHex("2e3440")
palette.black3 = Color3.fromHex("3b4252")
palette.black4 = Color3.fromHex("434c5e")
palette.black5 = Color3.fromHex("4c566a")

palette.gray1 = Color3.fromHex("646d7f") --*
palette.gray2 = Color3.fromHex("828893") --*
palette.gray3 = Color3.fromHex("8b9099") --*
palette.gray4 = Color3.fromHex("a6aab2") --*
palette.gray5 = Color3.fromHex("bdc2cc") --*

palette.white3 = Color3.fromHex("d8dee9")
palette.white2 = Color3.fromHex("e5e9f0")
palette.white1 = Color3.fromHex("eceff4")

palette.accent1 = Color3.fromHex("88c0d0")
palette.accent2 = Color3.fromHex("8fbcbb")
palette.accent3 = Color3.fromHex("81a1c1")
palette.accent4 = Color3.fromHex("4d679e") --*
palette.accent5 = palette.accent4

local DEFAULT_COLOR1 = palette.accent1
local DEFAULT_COLOR2 = palette.accent2
local DEFAULT_COLOR3 = palette.accent3

-- there is the aurora palette but im lazy.
palette.brown1 = DEFAULT_COLOR1
palette.brown2 = DEFAULT_COLOR2
palette.brown3 = DEFAULT_COLOR3
palette.red1 = DEFAULT_COLOR1
palette.red2 = DEFAULT_COLOR2
palette.red3 = DEFAULT_COLOR3
palette.orange1 = DEFAULT_COLOR1
palette.orange2 = DEFAULT_COLOR2
palette.orange3 = DEFAULT_COLOR3
palette.yellow1 = DEFAULT_COLOR1
palette.yellow2 = DEFAULT_COLOR2
palette.yellow3 = DEFAULT_COLOR3
palette.green1 = DEFAULT_COLOR1
palette.green2 = DEFAULT_COLOR2
palette.green3 = DEFAULT_COLOR3
palette.blue1 = DEFAULT_COLOR1
palette.blue2 = DEFAULT_COLOR2
palette.blue3 = DEFAULT_COLOR3
palette.cyan1 = DEFAULT_COLOR1
palette.cyan2 = DEFAULT_COLOR2
palette.cyan3 = DEFAULT_COLOR3
palette.pink1 = DEFAULT_COLOR1
palette.pink2 = DEFAULT_COLOR2
palette.pink3 = DEFAULT_COLOR3
palette.purple1 = DEFAULT_COLOR1
palette.purple2 = DEFAULT_COLOR2
palette.purple3 = DEFAULT_COLOR3

return palette :: colortype.Palette
