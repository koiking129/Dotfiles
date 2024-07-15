-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- Hold the configuration
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = 'Dracula'
config.window_background_opacity = 0.9
config.text_background_opacity = 0.9

-- Font
config.font = wezterm.font_with_fallback {
  'JetBrainsMono NF',
  'Noto Sans CJK SC',
}
config.font_size = 14

-- Window size
config.initial_rows = 30
config.initial_cols = 120
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Tab switching
config.keys = {
  { key = '{', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = '}', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },
}

-- Return the configuration to wezterm
return config
