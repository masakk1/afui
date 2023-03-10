type c3 = Color3

-- TEMPLATE:
-- source: www.example.com or @masakk1
-- starred (*) are not provided by the source.

-- INFO:
-- generally the 1 means that "strongest" of that color.
-- white1 -> brighest ==> white3 -> darkest
-- dark1  -> darkest  ==> dark5  -> brighest

-- TYPE:
export type Palette = {
    -- basic black/write
    black1: c3; --> darkest
    black2: c3;
    black3: c3;
    black4: c3;
    black5: c3;

    gray1: c3; --dark
    gray2: c3;
    gray3: c3;
    gray4: c3;
    gray5: c3; --bright

    white3: c3; --//this is 3
    white2: c3;
    white1: c3; --> brightest

    -- accents
    accent1: c3; --> strongest
    accent2: c3;
    accent3: c3;
    accent4: c3;
    accent5: c3;

    -- colors
    --> strongest = 1
    brown1: c3;     brown2: c3;     brown3: c3;
    red1: c3;       red2: c3;       red3: c3;
    orange1: c3;    orange2: c3;    orange3: c3;
    yellow1: c3;    yellow2: c3;    yellow3: c3;
    green1: c3;     green2: c3;     green3: c3;
    blue1: c3;      blue2: c3;      blue3: c3;
    cyan1: c3;      cyan2: c3;      cyan3: c3;
    pink1: c3;      pink2: c3;      pink3: c3;
    purple1: c3;    purple2: c3;    purple3: c3;
}

return {}