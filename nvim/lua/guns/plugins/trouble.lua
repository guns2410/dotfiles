return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>xx",
			function()
				require("trouble").toggle()
			end,
			{ desc = "Toggle trouble" },
		},
		{
			"<leader>xw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			{ desc = "Toggle workspace diagnostics" },
		},
		{
			"<leader>xd",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			{ desc = "Toggle document diagnostics" },
		},
		{
			"<leader>xf",
			function()
				require("trouble").toggle("quickfix")
			end,
			{ desc = "Toggle quickfix" },
		},
		{
			"<leader>xl",
			function()
				require("trouble").toggle("loclist")
			end,
			{ desc = "Toggle loclist" },
		},
		{
			"gR",
			function()
				require("trouble").toggle("lsp_references")
			end,
			{ desc = "Toggle lsp references" },
		},
	},
	opts = {
		icons = true,
		mode = "workspace_diagnostics",
	},
	config = function()
		local trouble = require("trouble.providers.telescope")
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-h>"] = trouble.open_with_trouble },
					n = { ["<c-h>"] = trouble.open_with_trouble },
				},
			},
		})
	end,
}
