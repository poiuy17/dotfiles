-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
-- local config = wezterm.config_builder()
local config = {}

-- Mux is the mutliplexes for windows etc inside of the terminal
-- Action is to perform actions on the terminal
local mux = wezterm.mux
local act = wezterm.action

-- This is for newer wezterm vertions to use the config builder
if wezterm.config_builder then
  config = wezterm.config_builder()
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { "pwsh.exe", "-NoLogo" }
end

-- For example, changing the color scheme:
-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'GruvboxDark'
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 14

config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

-- config.initial_rows = 40
-- config.initial_cols = 150
-- Key Bingind
config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  { key = 'a', mods = 'LEADER|CTRL',  action = wezterm.action { SendString = "\x01" } },
  { key = "V", mods = 'SHIFT|CTRL',   action = act.PasteFrom 'Clipboard' },

  { key = "h", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection("Left"), },
  { key = "l", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection("Right"), },
  { key = "k", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection("Up"), },
  { key = "j", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection("Down"), },

  { key = '-', mods = "LEADER",       action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" }, }), },
  { key = '=', mods = "LEADER|SHIFT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" }, }), },

  -- { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
  -- { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
  -- { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
  -- { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },

  { key = "x", mods = "LEADER",       action = wezterm.action.CloseCurrentPane({ confirm = false }) },
  { key = "c", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },

  { key = "r", mods = "LEADER",       action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },

}

config.key_tables = {
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize { "Left", 5 } },
    { key = "j",      action = act.AdjustPaneSize { "Down", 5 } },
    { key = "k",      action = act.AdjustPaneSize { "Up", 5 } },
    { key = "l",      action = act.AdjustPaneSize { "Right", 5 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
}

config.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- and finally, return the configuration to wezterm
return config
