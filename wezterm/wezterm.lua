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
config.font = wezterm.font("inconsolata lgc nerd font mono")
-- config.font = wezterm.font("jetbrainsmononl nerd font mono")
-- config.font = wezterm.font("ubuntumono nerd font")
-- config.font = wezterm.font_with_fallback({ "MonoLisa", "MesloLGLDZ Nerd Font Mono" })
-- config.font = wezterm.font("MonoLisa", { weight = "Regular" })
config.font_size = 14.0
-- config.line_height = 1.15
-- config.cell_width = 1.00592.0
-- config.dpi = 92.0
-- -- This increases color saturation by 50%
config.foreground_text_hsb = {
	hue = 1.03,
	saturation = 1.17,
	brightness = 1.5,
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

config.term = "wezterm"
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true
-- config.font_rasterizer = "FreeType"
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"
config.bold_brightens_ansi_colors = true
config.ime_preedit_rendering = "System"
config.macos_forward_to_ime_modifier_mask = "SHIFT"
config.native_macos_fullscreen_mode = true

local dimmer = { brightness = 0.10 }

config.background = {
	{
		source = {
			-- File = "/Users/gunjansoni/Pictures/w03007-small.jpg", -- jellyfish 1
			-- File = "/Users/gunjansoni/Pictures/DALL·E Bio-luminescence Wallpaper.jpeg", -- jellyfish 2
			File = "/Users/gunjansoni/Pictures/Jellyfish 3.jpg", -- jellyfish
			-- File = "/Users/gunjansoni/Pictures/assassins-creed-valhalla-viking-raider-eivor-pc-games-3860x2160-601.jpg", -- viking
			-- File = "/Users/gunjansoni/Pictures/Vivid Anime.png", -- anime 1
			-- File = "/Users/gunjansoni/Pictures/Vivid Anime Wallpaper.png", -- anime 2
			-- File = "/Users/gunjansoni/Pictures/DALL·E Anime Wallpaper.png", -- anime 3
			-- File = "/Users/gunjansoni/Pictures/Gungrave Gore 3840x2160.jpg", -- gungore
			-- File = "/Users/gunjansoni/Pictures/AI Generated Image Mar 25 (3).png", -- gaming 1
			-- File = "/Users/gunjansoni/Pictures/AI Generated Image March 25 (2).png", -- gaming 1
		},
		repeat_x = "Mirror",
		repeat_y = "Mirror",
		hsb = dimmer,
		-- attachment = { Parallax = 0.1 },
	},
}

-- and finally, return the configuration to wezterm
return config
