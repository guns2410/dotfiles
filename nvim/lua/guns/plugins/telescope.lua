return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
	},
	keys = {
		{
			"<leader>pf",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "Find files" },
		},
		{
			"<C-p>",
			"<cmd>lua require('telescope.builtin').git_files()<cr>",
			{ desc = "Find in git files" },
		},
		{
			"<leader>ps",
			"<cmd>lua require('telescope.builtin').grep_string()<cr>",
			{ desc = "Project search for a string" },
		},
		{
			"<leader>o",
			"<cmd>lua require('telescope.builtin').oldfiles()<cr>",
			{ desc = "Recent files" },
		},
		{
			"<leader>O",
			"<cmd>lua require('telescope.builtin').buffers()<cr>",
			{ desc = "Recent buffers" },
		},
		{
			"<leader>/",
			"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false }))<cr>",
			{ desc = "Fuzzy search in current buffer" },
		},
		{
			"<leader>gf",
			"<cmd>lua require('telescope.builtin').git_files()<cr>",
			{ desc = "Search git files" },
		},
		{
			"<leader>sf",
			"<cmd>lua require('telescope.builtin').find_files()<cr>",
			{ desc = "Search files" },
		},
		{
			"<leader>sh",
			"<cmd>lua require('telescope.builtin').help_tags()<cr>",
			{ desc = "Search help" },
		},
		{
			"<leader>lg",
			"<cmd>lua require('telescope.builtin').live_grep()<cr>",
			{ desc = "Live grep" },
		},
		{
			"<leader>bb",
			"<cmd>lua require('telescope.builtin').buffers()<cr>",
			{ desc = "Buffers" },
		},
		{
			"<leader>ff",
			"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
			{ desc = "Buffers fuzzy" },
		},
		{
			"<leader>bh",
			"<cmd>lua require('telescope.builtin').oldfiles()<cr>",
			{ desc = "Buffers history" },
		},
		{
			"<leader>fg",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
			{ desc = "Live grep with args" },
		},
	},
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "ivy",
				},
				buffers = {
					theme = "ivy",
					sort_lastused = true,
				},
				current_buffer_fuzzy_find = {
					theme = "dropdown",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
				},
			},
			defaults = require("telescope.themes").get_ivy({
				-- winblend = 10,
				-- layout_config = {
				-- 	width = 0.9,
				-- 	height = 0.9,
				-- },
				path_display = { "truncate" },
			}),
			-- shorten_path = true,
		})

		local telescope = require("telescope")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							-- freeze the current list and start a fuzzy search in the frozen list
							["<C-space>"] = lga_actions.to_fuzzy_refine,
						},
					},
					-- ... also accepts theme settings, for example:
					-- theme = "dropdown", -- use dropdown theme
					-- theme = { }, -- use own theme spec
					-- layout_config = { mirror=true }, -- mirror preview pane
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")
		telescope.load_extension("live_grep_args")
	end,
}
