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

config.color_scheme = 'GruvboxDark'
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 14

config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9

config.inactive_pane_hsb = {
  saturation = 0.3,
  brightness = 0.3,
}

-- Key Bingind
config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  { key = 'a',          mods = 'LEADER|CTRL', action = wezterm.action { SendString = "\x01" } },
  { key = "v",          mods = 'SHIFT|CTRL',  action = act.PasteFrom 'Clipboard' },
  { key = "c",          mods = "SHIFT|CTRL",  action = act.CopyTo("Clipboard") },

  { key = "h",          mods = "ALT",         action = wezterm.action.ActivatePaneDirection("Left"), },
  { key = "j",          mods = "ALT",         action = wezterm.action.ActivatePaneDirection("Down"), },
  { key = "k",          mods = "ALT",         action = wezterm.action.ActivatePaneDirection("Up"), },
  { key = "l",          mods = "ALT",         action = wezterm.action.ActivatePaneDirection("Right"), },

  { key = '-',          mods = "LEADER",      action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" }, }), },
  { key = '\\',          mods = "LEADER",      action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" }, }), },

  { key = "x",          mods = "LEADER",      action = wezterm.action.CloseCurrentPane({ confirm = false }) },
  { key = "c",          mods = "LEADER",      action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "z",          mods = "LEADER",      action = "TogglePaneZoomState" },

  { key = "LeftArrow",  mods = "SHIFT|CTRL",  action = act.AdjustPaneSize({ "Left", 1 }) },
  { key = "UpArrow",    mods = "SHIFT|CTRL",  action = act.AdjustPaneSize({ "Up", 1 }) },
  { key = "DownArrow",  mods = "SHIFT|CTRL",  action = act.AdjustPaneSize({ "Down", 1 }) },
  { key = "RightArrow", mods = "SHIFT|CTRL",  action = act.AdjustPaneSize({ "Right", 1 }) },

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
