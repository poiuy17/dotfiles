local wezterm = require 'wezterm'

local config = {}
local mux = wezterm.mux
local act = wezterm.action

if wezterm.config_builder then
  config = wezterm.config_builder()
end

if string.find(wezterm.target_triple, "windows") then
  config.default_domain = 'WSL:Ubuntu'
end

-- config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.color_scheme = 'Nord (Gogh)'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 14
config.line_height = 1.0

config.window_background_opacity = 0.9

config.hide_tab_bar_if_only_one_tab = true

config.disable_default_key_bindings = true
config.keys = {
  { key = "v", mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = act.Nop,
  },
  {
    event = { Up = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Up = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'Clipboard',
  },
}

config.selection_word_boundary = " \t\n{}[]()<>\"'`"

-- wezterm.on('gui-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   window:gui_window():maximize()
-- end)

return config
