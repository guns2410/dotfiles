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
				bold_vert_split = true,
				disable_italics = false,
				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},
				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- local bg = "#011628"
			-- local bg_dark = "#011423"
			-- local bg_highlight = "#143652"
			-- local bg_search = "#0A64AC"
			-- local bg_visual = "#275378"
			-- local fg = "#CBE0F0"
			-- local fg_dark = "#B4D0E9"
			-- local fg_gutter = "#627E97"
			-- local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = true,
				-- on_colors = function(colors)
				-- 	colors.bg = bg
				-- 	colors.bg_dark = bg_dark
				-- 	colors.bg_float = bg_dark
				-- 	colors.bg_highlight = bg_highlight
				-- 	colors.bg_popup = bg_dark
				-- 	colors.bg_search = bg_search
				-- 	colors.bg_sidebar = bg_dark
				-- 	colors.bg_statusline = bg_dark
				-- 	colors.bg_visual = bg_visual
				-- 	colors.border = border
				-- 	colors.fg = fg
				-- 	colors.fg_dark = fg_dark
				-- 	colors.fg_float = fg
				-- 	colors.fg_gutter = fg_gutter
				-- 	colors.fg_sidebar = fg_dark
				-- end,
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
			show_end_of_buffer = true,
			term_colors = true,
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				lsp_trouble = true,
				which_key = true,
				telescope = { enabled = true },
				mini = {
					enabled = true,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				treesitter_context = true,
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
					styles = {
						comments = "italic",
						types = "italic",
					},
				},
				groups = {
					all = {
						LspInlayHint = { bg = "NONE" },
					},
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
	{
		"marko-cerovac/material.nvim",
		priority = 1000,
		config = true,
		opts = {
			disable = {
				colored_cursor = false, -- Disable the colored cursor
				borders = false, -- Disable borders between verticaly split windows
				background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
				term_colors = false, -- Prevent the theme from setting terminal colors
				eob_lines = false, -- Hide the end-of-buffer lines
			},
			high_visibility = {
				lighter = false, -- Enable higher contrast text for lighter style
				darker = false, -- Enable higher contrast text for darker style
			},
			contrast = {
				terminal = true,
				sidebars = true,
				floating_windows = true,
				cursor_line = true,
				lsp_virtual_text = true,
				non_current_windows = true,
			},
			styles = {
				comments = { italic = true },
				strings = { bold = false },
			},
			plugins = { -- Uncomment the plugins that you use to highlight them
				-- "coc"
				-- "dap",
				-- "dashboard",
				-- "eyeliner",
				-- "fidget",
				-- "flash",
				"gitsigns",
				"harpoon",
				-- "hop",
				-- "illuminate",
				-- "indent-blankline",
				-- "lspsaga",
				-- "mini",
				"neogit",
				-- "neotest",
				-- "neo-tree",
				-- "neorg",
				-- "noice",
				"nvim-cmp",
				-- "nvim-navic",
				"nvim-tree",
				"nvim-web-devicons",
				-- "rainbow-delimiters",
				-- "sneak",
				"telescope",
				"trouble",
				"which-key",
				"nvim-notify",
			},
		},
	},
}
