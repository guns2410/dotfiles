return {
	{ "norcalli/nvim-colorizer.lua" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				variant = "auto",
				bold_vert_split = false,
				disable_italics = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = false,
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
			-- load the colorscheme here
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		opts = {
			undercurl = true,
			transparent = true,
			dimInactive = false,
			theme = "dragon",
			commentStyle = { italic = true },
			terminalColors = true,
		},
		config = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				telescope = true,
				mini = {
					enabled = true,
				},
			},
		},
		config = true,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		config = true,
		opts = {
			transparent_bg = true,
			italic_comment = true,
			show_end_of_buffer = true,
		},
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
					terminal_colors = true,
				},
			})
		end,
	},
	{
		"tjdevries/colorbuddy.nvim",
		config = function()
			require("colorbuddy").setup()
			local Color = require("colorbuddy").Color
			local Group = require("colorbuddy").Group
			local g = require("colorbuddy.group").groups
			local c = require("colorbuddy.color").colors
			local s = require("colorbuddy.style").styles
			local b = s.bold
			local i = s.italic
			local n = s.inverse
			local uc = s.undercurl
			local ul = s.underline
			local r = s.reverse
			local sto = s.standout
			local no = s.NONE
			local v = vim.g

			v.colors_name = "bunnitheme"

			local palette = {
				background = "#171717",
				foreground = "#C5C8C6",
				comment = "#504F4F",
				cyan = "#04D7D7",
				green = "#31BB71",
				pink = "#FF64C8",
				purple = "#6B50FF",
				red = "#D74E6F",
				yellow = "#D3E561",
			}

			-- initialize all colors from palette
			for key, value in pairs(palette) do
				Color.new(key, value)
			end

			Group.new("Normal", c.foreground, c.none, no)
			Group.new("String", c.green, c.none, no)
			Group.new("Comment", c.comment, c.none, i)
			Group.new("SpecialComment", c.foreground, c.purple, i)
			Group.new("Warnings", c.yellow, c.none, no)
			Group.new("Error", c.red, c.none, no)
			Group.new("Todo", c.cyan, c.none, no)
			Group.new("Special", c.foreground, c.none, no)
			Group.new("Identifier", c.foreground, c.none, no)
			Group.new("Label", c.purple, c.none, no)
			Group.new("LineNr", c.comment, c.none, no)
			Group.new("Typedef", c.purple, c.none, no)
			Group.new("Conditional", c.pink, c.none, no)
			Group.new("Function", c.cyan, c.none, no)
			Group.new("Statement", c.red, c.none, no)
			Group.new("Include", c.yellow, c.none, no)
			Group.new("Operator", c.purple, c.none, no)
			Group.new("MatchParen", c.background, c.pink, no)
			Group.new("Constant", c.yellow, c.none, b)
			Group.new("Boolean", c.purple, c.none, no)
			Group.new("Number", c.pink, c.none, no)
			Group.new("Structure", c.purple, c.none, no)
			Group.new("Cursor", c.foreground, c.purple, no)

			-- LSP: this one seems to do the trick on nightly
			Group.new("DiagnosticError", c.red, c.none, i)
			Group.new("DiagnosticWarn", c.yellow, c.none, i)
			Group.new("DiagnosticHint", c.green, c.none, i)
			Group.new("DiagnosticInfo", c.yellow, c.none, i)

			-- diff
			Group.new("diffAdded", c.green, c.none, no)
			Group.new("diffRemoved", c.red, c.none, no)
			Group.new("diffChanged", c.pink, c.none, no)

			-- status line of current window
			Group.new("StatusLine", c.none, c.comment, no)
		end,
	},
}
