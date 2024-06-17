return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Toggle trouble",
		},
		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Toggle workspace diagnostics",
		},
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Toggle document diagnostics",
		},
		{
			"<leader>xf",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Toggle quickfix",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Toggle loclist",
		},
		{
			"gR",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "Toggle lsp references",
		},
	},
	opts = {},
	config = function()
		require("trouble").setup({})
		local actions = require("telescope.actions")
		local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-o>"] = open_with_trouble, ["<c-.>"] = add_to_trouble },
					n = { ["<c-o>"] = open_with_trouble, ["<c-.>"] = add_to_trouble },
				},
			},
		})
	end,
}
