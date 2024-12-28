-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "rose-pine"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Dracula (Gogh)"
-- config.color_scheme = "Gruvbox Dark"

-- config.font = wezterm.font("meslolgl nerd font mono")
-- config.font = wezterm.font("inconsolata lgc nerd font mono")
config.font = wezterm.font("jetbrainsmononl nerd font mono")
-- config.font = wezterm.font("ubuntumono nerd font")
-- config.font = wezterm.font_with_fallback({ "MonoLisa", "MesloLGLDZ Nerd Font Mono" })
-- config.font = wezterm.font("MonoLisa", { weight = "Regular" })
config.font_size = 14.0
-- config.line_height = 1.015
-- config.cell_width = 1.00592
-- config.dpi = 72.0
-- config.dpi = 144.0
-- -- This increases color saturation by 50%
config.foreground_text_hsb = {
	hue = 1.03,
	saturation = 1.07,
	brightness = 1.15,
}
config.inactive_pane_hsb = {
	hue = 1.03,
	saturation = 1.15,
	brightness = 0.5,
}
config.anti_alias_custom_block_glyphs = true
config.adjust_window_size_when_changing_font_size = false

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.scrollback_lines = 3500
config.window_decorations = "RESIZE"

config.term = "xterm-256color"
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true
-- config.font_rasterizer = "FreeType"
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"
config.bold_brightens_ansi_colors = true
config.ime_preedit_rendering = "System"
config.macos_forward_to_ime_modifier_mask = "SHIFT"
config.native_macos_fullscreen_mode = true

local dimmer = { brightness = 0.15 }
local imagesDir = os.getenv("HOME") .. "/.config/images/"

local backgroundImages = {
	jellyfish = imagesDir .. "/Jellyfish-3.png",
	space1 = imagesDir .. "/black-space-1.png",
	space2 = imagesDir .. "/black-space-2.png",
	space3 = imagesDir .. "/space3.png",
}

-- config.background = {
-- 	{
-- 		source = { File = backgroundImages.jellyfish },
-- 		repeat_x = "Mirror",
-- 		repeat_y = "Mirror",
-- 		hsb = dimmer,
-- 		-- attachment = { Parallax = 0.1 },
-- 	},
-- }

-- and finally, return the configuration to wezterm
return config
