-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Color scheme - rose-pine-moon for a more aesthetic dark theme
config.color_scheme = "rose-pine-moon"
-- Alternative beautiful themes:
-- config.color_scheme = "Kanagawa Dragon (Gogh)"
-- config.color_scheme = "Tokyo Night Storm"
-- config.color_scheme = "Catppuccin Mocha"

-- Font configuration for optimal readability
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
	weight = "Regular",
	stretch = "Normal",
	style = "Normal",
})
config.font_size = 14.0
config.line_height = 1.1
config.cell_width = 1.0

-- Enhanced text rendering
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.1,
	brightness = 1.2,
}
config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 0.8,
	brightness = 0.6,
}
config.anti_alias_custom_block_glyphs = true
config.bold_brightens_ansi_colors = true

-- Performance and rendering
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"

-- Window and UI settings
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
config.scrollback_lines = 5000
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true

-- Terminal behavior
config.term = "xterm-256color"
config.ime_preedit_rendering = "System"
config.macos_forward_to_ime_modifier_mask = "SHIFT"
config.native_macos_fullscreen_mode = true
config.adjust_window_size_when_changing_font_size = false

-- Background configuration with beautiful space images
local configDir = os.getenv("HOME") .. "/.config/"
local imagesDir = configDir .. "Terminal-Backgrounds/"
local dimmer = { brightness = 0.12 }

-- Randomly select a beautiful background image
local function get_random_background()
	local backgrounds = {
		-- imagesDir .. "/Jellyfish-3.png",
		-- imagesDir .. "/black-space-1.png",
		-- imagesDir .. "/black-space-2.png",
		-- imagesDir .. "/space3.png",
		imagesDir .. "/misc/ow.jpg",
	}
	local random_index = math.random(#backgrounds)
	return backgrounds[random_index]
end

config.background = {
	{
		source = { File = get_random_background() },
		repeat_x = "Mirror",
		repeat_y = "Mirror",
		hsb = dimmer,
	},
}

-- Tab bar styling
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
config.tab_max_width = 25

-- Cursor styling
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800

-- and finally, return the configuration to wezterm
return config
