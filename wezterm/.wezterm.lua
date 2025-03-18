-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-macchiato"

config.font = wezterm.font_with_fallback({
	"CaskaydiaCove Nerd Font",
	"Fira Code",
})

config.font_size = 17
config.underline_thickness = 3
config.underline_position = -4

-- Window config
config.window_padding = {
	left = 4,
	right = 0,
	top = 2,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

config.audible_bell = "Disabled"

-- shell executable
config.default_prog = { "/opt/homebrew/bin/fish" }

-- and finally, return the configuration to wezterm
return config
