local wezterm = require("wezterm")

return {
	term = "wezterm",
	font = wezterm.font_with_fallback({
		"CaskaydiaCove Nerd Font",
		"Mononoki",
	}),
	font_size = 15.0,
	harfbuzz_features = {
		"calt=0",
		"zero",
		"ss01",
		"ss19",
		"clig=0",
		"liga=0",
	},
	bold_brightens_ansi_colors = true,

	-- Tab
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true, -- Smart tab bar [distraction-free mode]
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = true,
	tab_max_width = 32,
	use_fancy_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,
	show_new_tab_button_in_tab_bar = false,

	window_padding = {
		left = 10,
		right = 10,
		top = 5,
		bottom = 5,
	},

	window_decorations = "NONE",
	-- Initial window size on startup
	initial_rows = 22,
	initial_cols = 72,
	adjust_window_size_when_changing_font_size = true,
	--Scrollback config
	enable_scroll_bar = false,
	--scrollback_lines = 5000, -- How many lines of scrollback you want to retain per tab (default is 3500)

	default_cursor_style = "BlinkingBlock",
	-- enable_wayland = true,
	enable_wayland = false,
	use_ime = false,
	default_prog = { "/usr/bin/zsh", "-l" }, -- Spawn a zsh shell in login mode
	default_cwd = "$HOME",
	warn_about_missing_glyphs = false,
	check_for_updates = false,
	exit_behavior = "Close",
	audible_bell = "Disabled",
	color_scheme = "Catppuccin Mocha",
	window_background_opacity = 1.00,
	colors = {
		-- cursor_bg = '#0000ff',
		cursor_bg = "gray",
		-- Overrides the text color when the current cell is occupied by the cursor
		cursor_fg = "white",
	},

	keys = {
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "DownArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "q",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			key = "h",
			mods = "ALT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "ALT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "ALT",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "ALT",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			-- browser-like bindings for tabbing
			key = "t",
			mods = "CTRL",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		},
	},
}
