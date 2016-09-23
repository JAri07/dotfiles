local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. "utilities/"

return {
	-- Default Applications
	default = {
		-- Default terminal emulator
		terminal = "kitty",
		-- Defalut music client
		music_player = "kitty --class music -e ncmpcpp",
		-- Default text editor
    -- text_editor = string.format("%s/.config/awesome.my/scripts/editor_cmd.sh", os.getenv("HOME")),
		-- Default code editor
    -- code_editor = utils_dir .. "open_terminal_program nvim",
    code_editor = string.format(utils_dir .. "open_terminal_program nvim"),
    -- code_editor = "" .. utils_dir .. "open_terminal_program nvim",

		-- Default web browser
    firejail = "firejail",
		web_browser1 = "firefox",
		web_browser2 = "brave",
		web_browser3 = "tor-browser",
		-- Default file manager
		file_manager = "nemo",
		-- Default network manager
		network_manager = "kitty -e nmtui",
		-- Default bluetooth manager
		bluetooth_manager = "blueman-manager",
		-- Default power manager
		power_manager = "xfce4-power-manager",
		-- Default rofi global menu
		app_launcher = "rofi -no-lazy-grab -show drun -modi drun -theme " .. config_dir .. "configuration/rofi.rasi",
	},

	-- List of binaries/shell scripts that will execute for a certain task
	utils = {
		-- Fullscreen screenshot
		full_screenshot = utils_dir .. "screensht full",
		-- Area screenshot
		area_screenshot = utils_dir .. "screensht area",
		-- Color Picker
		color_picker = utils_dir .. "xcolor-pick",
    -- Nvim
    nvim = utils_dir .. "open_terminal_program nvim",
    -- Xplr
    xplr = utils_dir .. "open_terminal_program xplr",
	},
}
