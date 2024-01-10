return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- keys = {
	--     { '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" } },
	--     { '<leader>tf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = "Find file in NvimTree" } },
	--     { '<leader>tr', ':NvimTreeRefresh<CR>', { noremap = true, silent = true, desc = "Refresh NvimTree" } },
	-- },
	config = function()
		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#4b5263 ]])

		require("nvim-tree").setup()

		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 40,
			},
			renderer = {
				group_empty = true,
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
						},
						folder = {
							default = "",
							open = "",
							symlink = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = { enable = true },
					quit_on_open = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", {
			noremap = true,
			silent = true,
			desc = "Toggle NvimTree",
		})

		vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", {
			noremap = true,
			silent = true,
			desc = "Find file in NvimTree",
		})

		vim.keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>", {
			noremap = true,
			silent = true,
			desc = "Refresh NvimTree",
		})
	end,
}
