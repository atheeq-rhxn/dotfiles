local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {}

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

config.window_decorations = 'NONE'
config.enable_tab_bar = false
config.window_background_opacity = 0.7
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 17 

return config
