local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	if mux then
  	local tab, pane, window = mux.spawn_window(cmd or {})
  	window:gui_window():maximize()
	end
end)

local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

config.front_end = "WebGpu"
config.max_fps = 120
config.animation_fps = 120
config.cursor_blink_rate = 250
config.default_prog = { "/home/atheeq/.cargo/bin/zellij" }
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.7
config.window_decorations = "NONE"
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "catppuccin-mocha"
config.font_size = 16
return config
