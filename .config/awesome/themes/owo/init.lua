local theme = {}

local beautiful = require("beautiful")
local theme_assets = require("beautiful.theme_assets")
local gfs = require("gears.filesystem")
local icons_path = gfs.get_configuration_dir() .. "themes/owo/components/icons/"

theme.font          = "Terminus 9"

theme.bg_normal     = "#2E3440"
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = "#BF616A"
theme.bg_minimize   = "#4c566a"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aeb3bb"
theme.fg_focus      = "#5E81AC"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = 3
theme.border_width  = 2
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.fg_focus
theme.border_marked = theme.fg_focus

theme.bar_height = 25

theme.systray_icon_spacing = 1;

-- Generate taglist squares:
local taglist_square_size = 4

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
        taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
        taglist_square_size, theme.fg_normal
)

-- You can use your own layout icons like this:
--theme.layout_fairh      = icons_path.."layouts/fairhw.png"
--theme.layout_fairv      = icons_path.."layouts/fairvw.png"
theme.layout_floating   = icons_path.."layouts/floatingw.png"
--theme.layout_magnifier  = icons_path.."layouts/magnifierw.png"
--theme.layout_max        = icons_path.."layouts/maxw.png"
--theme.layout_fullscreen = icons_path.."layouts/fullscreenw.png"
--theme.layout_tilebottom = icons_path.."layouts/tilebottomw.png"
--theme.layout_tileleft   = icons_path.."layouts/tileleftw.png"
theme.layout_tile       = icons_path.."layouts/tilew.png"
--theme.layout_tiletop    = icons_path.."layouts/tiletopw.png"
--theme.layout_spiral     = icons_path.."layouts/spiralw.png"
--theme.layout_dwindle    = icons_path.."layouts/dwindlew.png"
--theme.layout_cornernw   = icons_path.."layouts/cornernww.png"
--theme.layout_cornerne   = icons_path.."layouts/cornernew.png"
--theme.layout_cornersw   = icons_path.."layouts/cornersww.png"
--theme.layout_cornerse   = icons_path.."layouts/cornersew.png"

beautiful.init(theme)

require("themes.owo.components.bar")
require("themes.owo.components.window")
