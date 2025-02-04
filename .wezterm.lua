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

-- Windows specific
if wezterm.target_triple:find('windows') then
  -- Remove the title bar
  config.window_decorations = 'RESIZE'

  -- Use powershell as default
  config.default_prog = { 'pwsh', '-nologo' }

  -- Disable Alt-Space opening menu on Windows
  table.insert(config.keys, { key = 'Space', mods = 'ALT', action = wezterm.action.SendKey { key = 'Space', mods = 'ALT' } })

  -- Center the window on startup
  wezterm.on('gui-startup', function(cmd)
    local screen = wezterm.gui.screens().main
    local ratio = 0.8
    local width, height = screen.width * ratio, screen.height * ratio
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {
      position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
    })
    window:gui_window():set_inner_size(width, height)
  end)

  -- Fix the display issue (recurrent: minimize and restore the window)
  config.window_padding = { left = 1, right = 1, top = 1, bottom = 1 }
end

-- Return the configuration to wezterm
return config
