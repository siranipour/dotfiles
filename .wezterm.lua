local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Moon'


config.font = wezterm.font("JetBrains Mono")
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.99
-- config.macos_window_background_blur = 10

config.audible_bell = "Disabled"

config.max_fps = 144
config.animation_fps = 144

config.send_composed_key_when_left_alt_is_pressed = true

-- always warn irrespective of what process is running
config.skip_close_confirmation_for_processes_named = {}

return config
