local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local nu_path = "/home/atheeq/.cargo/bin/nu"

local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

config.default_prog = { nu_path, "-l"}

config.front_end = "WebGpu"
config.max_fps = 120
config.animation_fps = 60
config.cursor_blink_rate = 250
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.7
config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "catppuccin-mocha"
config.font_size = 16

config.keys = {

  -- Pane splitting actions
  { key = "x",
    mods = "ALT",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  { key = "y",
    mods = "ALT",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  -- Pane navigation actions
  { key = "h",
    mods = "ALT",
    action = act.ActivatePaneDirection "Left",
  },
  { key = "j",
    mods = "ALT",
    action = act.ActivatePaneDirection "Down",
  },
  { key = "k",
    mods = "ALT",
    action = act.ActivatePaneDirection "Up",
  },
  { key = "l",
    mods = "ALT",
    action = act.ActivatePaneDirection "Right",
  },

  -- Pane management actions
  { key = "c",
    mods = "ALT",
    action = act.CloseCurrentPane { confirm = true },
  },
  { key = "o",
    mods = "ALT",
    action = act.TogglePaneZoomState,
  },
  { key = "u",
    mods = "ALT",
    action = act.RotatePanes "Clockwise",
  },
  { key = "s",
    mods = "ALT",
    action = act.PaneSelect { mode = "SwapWithActive" },
  },

  -- Tab management actions
  { key = "t",
    mods = "ALT",
    action = act.SpawnTab "CurrentPaneDomain",
  },
  { key = "[",
    mods = "ALT",
    action = act.ActivateTabRelative(-1),
  },
  { key = "]",
    mods = "ALT",
    action = act.ActivateTabRelative(1),
  },
  { key = "{",
    mods = "ALT|SHIFT",
    action = act.MoveTabRelative(-1),
  },
  { key = "}",
    mods = "ALT|SHIFT",
    action = act.MoveTabRelative(1),
  },

  -- Key table activation
  { key = "r",
    mods = "ALT",
    action = act.ActivateKeyTable { name = "resize_pane", one_shot = false },
  },
  { key = "m",
    mods = "ALT",
    action = act.ActivateKeyTable { name = "move_tab", one_shot = false },
  },
}

config.key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize { "Left", 1 } },
    { key = "j", action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k", action = act.AdjustPaneSize { "Up", 1 } },
    { key = "l", action = act.AdjustPaneSize { "Right", 1 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },

  move_tab = {
    { key = "h", action = act.MoveTabRelative(-1) },
    { key = "j", action = act.MoveTabRelative(-1) },
    { key = "k", action = act.MoveTabRelative(1) },
    { key = "l", action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
}

return config
