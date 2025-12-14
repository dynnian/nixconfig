-- {{{ Imports
local gears     = require("gears")
local dpi       = require("beautiful.xresources").apply_dpi
local beautiful = require("beautiful")
-- }}}

local themes_path = string.format("%s/.config/awesome/theme/", os.getenv("HOME"))

-- {{{ Main
local theme = {}
-- }}}

-- {{{ theme font
theme.font      = "mononoki Nerd Font Mono 10"
theme.icon_font = "Symbols Nerd Font Mono 12"
-- }}}

-- {{{ bar colors
theme.bar_bg_one  = "#cba6f7"
theme.bar_bg_two  = "#89b4fa"
theme.bar_bg_tre  = "#94e2d5"
theme.bar_bg_for  = "#a6e3a1"
theme.bar_bg_fiv  = "#f9e2af"
theme.bar_clock   = "#313244"
theme.bar_fg_dark = "#1e1e2e"
-- }}}

-- {{{ Colors
theme.fg_normal = "#cdd6f4"
theme.fg_focus  = "#bac2de"
theme.fg_urgent = "#f38ba8"
theme.bg_normal = "#1e1e2e"
-- }}}

-- {{{ Borders
beautiful.gap_single_client = false
theme.useless_gap   = dpi(4)
theme.border_width  = dpi(2)
theme.border_normal = "#313244"
theme.border_focus  = "#89b4fa"
theme.border_marked = theme.border_focus
-- }}}

-- {{{ Taglist
theme.taglist_font        = "Symbols Nerd Font Mono 14"
theme.taglist_fg_focus    = "#89b4fa"
theme.taglist_fg_occupied = "#a6e3a1"
theme.taglist_fg_urgent   = "#f38ba8"
theme.taglist_fg_empty    = "#6c7086"
theme.taglist_spacing     = 7
-- }}}

-- {{{ Notifications
theme.notification_font          = "mononoki Nerd Font 10"
theme.notification_bg            = "#1e1e2e"
theme.notification_bg_alt        = "#313244"
theme.notification_fg            = "#cdd6f4"
theme.notification_fg_alt        = "#bac2de"
theme.notification_critical      = "#f38ba8"
theme.notification_border_color  = "#45475a"
theme.notification_border_width  = dpi(2)
theme.notification_shape         = gears.shape.rounded_rect
-- }}}

-- {{{ Hotkeys Popup
theme.hotkeys_bg               = "#1e1e2e"
theme.hotkeys_fg               = "#cdd6f4"
theme.hotkeys_modifiers_fg     = "#94e2d5"
theme.hotkeys_label_bg         = "#f9e2af"
theme.hotkeys_label_fg         = "#1e1e2e"
theme.hotkeys_group_margin     = dpi(20)
theme.hotkeys_description_font = "mononoki Nerd Font 10"
theme.hotkeys_font             = "mononoki Nerd Font 10"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color   = "#f38ba8"
theme.mouse_finder_radius  = dpi(5)
theme.mouse_finder_timeout = 10
-- }}}

-- {{{ Layout Icons
local layout_accent = theme.fg_normal
theme.layout_tile       = gears.color.recolor_image(themes_path .. "icons/tilew.png", layout_accent)
theme.layout_centerwork = gears.color.recolor_image(themes_path .. "icons/centerworkw.png", layout_accent)
theme.layout_tileleft   = gears.color.recolor_image(themes_path .. "icons/tileleftw.png", layout_accent)
theme.layout_tilebottom = gears.color.recolor_image(themes_path .. "icons/tilebottomw.png", layout_accent)
theme.layout_tiletop    = gears.color.recolor_image(themes_path .. "icons/tiletopw.png", layout_accent)
theme.layout_fairv      = gears.color.recolor_image(themes_path .. "icons/fairvw.png", layout_accent)
theme.layout_fairh      = gears.color.recolor_image(themes_path .. "icons/fairhw.png", layout_accent)
theme.layout_spiral     = gears.color.recolor_image(themes_path .. "icons/spiralw.png", layout_accent)
theme.layout_dwindle    = gears.color.recolor_image(themes_path .. "icons/dwindlew.png", layout_accent)
theme.layout_max        = gears.color.recolor_image(themes_path .. "icons/maxw.png", layout_accent)
theme.layout_fullscreen = gears.color.recolor_image(themes_path .. "icons/fullscreenw.png", layout_accent)
theme.layout_magnifier  = gears.color.recolor_image(themes_path .. "icons/magnifierw.png", layout_accent)
theme.layout_floating   = gears.color.recolor_image(themes_path .. "icons/floatingw.png", layout_accent)
theme.layout_cornernw   = gears.color.recolor_image(themes_path .. "icons/cornernw.png", layout_accent)
theme.layout_cornerne   = gears.color.recolor_image(themes_path .. "icons/cornerne.png", layout_accent)
theme.layout_cornersw   = gears.color.recolor_image(themes_path .. "icons/cornersw.png", layout_accent)
theme.layout_cornerse   = gears.color.recolor_image(themes_path .. "icons/cornerse.png", layout_accent)
-- }}}

return theme
