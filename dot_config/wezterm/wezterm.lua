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

-- Key Bingind
config.disable_default_key_bindings = true
config.keys = {
  { key = "V", mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
}

-- and finally, return the configuration to wezterm
return config
