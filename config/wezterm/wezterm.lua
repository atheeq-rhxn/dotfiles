local wezterm = require("wezterm")

local config = {}

config.default_prog = { "zellij" }
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.7
config.window_decorations = "NONE"
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "catppuccin-mocha"
config.font_size = 14
return config
