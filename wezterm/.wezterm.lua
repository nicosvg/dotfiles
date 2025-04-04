-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-macchiato"

config.font = wezterm.font_with_fallback({
	"CaskaydiaCove Nerd Font",
	"Fira Code",
})

config.font_size = 18
config.underline_thickness = 2
config.underline_position = -2

-- Window config
config.window_padding = {
	left = 4,
	right = 0,
	top = 2,
	bottom = 0,
}

-- Tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true

config.audible_bell = "Disabled"

-- Key bindings
-- config.leader = {
-- 	key = "a",
-- 	mods = "CTRL",
-- 	timeout_milliseconds = 2000,
-- }
-- Create a tab
config.keys = {
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
}

-- Tab bar
-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	local index = tab_info.tab_index + 1
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return index .. " " .. title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return index .. " " .. tab_info.active_pane.title
end

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#1e1e2e"
	local foreground = "#cdd6f4"

	if tab.is_active then
		background = "#585b70"
		foreground = "#cdd6f4"
	elseif hover then
		background = "#585b70"
		foreground = "#cdd6f4"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- shell executable
config.default_prog = { "/opt/homebrew/bin/fish" }

-- and finally, return the configuration to wezterm
return config
