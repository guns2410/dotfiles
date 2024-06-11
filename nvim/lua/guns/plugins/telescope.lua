return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
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
			}),
			shorten_path = true,
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("live_grep_args")
	end,
}
