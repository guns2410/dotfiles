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
-- config.color_scheme = "rose-pine"
config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Dracula (Gogh)"
-- config.color_scheme = "Gruvbox Dark"

config.font = wezterm.font("MesloLGLDZ Nerd Font Mono")
-- config.font = wezterm.font("MonoLisa", { weight = "Regular" })
config.font_size = 14.0
-- config.line_height = 1.1
-- config.cell_width = 0.95
config.dpi = 144.0
-- -- This increases color saturation by 50%
-- config.foreground_text_hsb = {
-- 	hue = 1.1,
-- 	saturation = 1.0,
-- 	brightness = 0.95,
-- }

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.scrollback_lines = 3500
config.window_decorations = "RESIZE"

config.term = "wezterm"
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true
-- config.font_rasterizer = "FreeType"
config.freetype_load_target = "VerticalLcd"
-- config.freetype_render_target = 'Light'
config.bold_brightens_ansi_colors = true
config.ime_preedit_rendering = "System"
config.macos_forward_to_ime_modifier_mask = "SHIFT"
config.native_macos_fullscreen_mode = true

config.window_background_image = "/Users/gunjansoni/Pictures/Vivid Anime.png"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.017,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,

	-- You can adjust the saturation also.
	saturation = 1.0,
}

-- and finally, return the configuration to wezterm
return config
