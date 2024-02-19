return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	keys = {
		{
			"<leader>ddg",
			function()
				require("neogen").generate()
			end,
			desc = "Generate doc with neogen",
		},
		{
			"<leader>ddf",
			function()
				require("neogen").generate({ type = "func" })
			end,
			desc = "Generate function doc with neogen",
		},
		{
			"<leader>ddc",
			function()
				require("neogen").generate({ type = "class" })
			end,
			desc = "Generate class doc with neogen",
		},
		{
			"<leader>ddt",
			function()
				require("neogen").generate({ type = "type" })
			end,
			desc = "Generate type doc with neogen",
		},
		{
			"<leader>ddl",
			function()
				require("neogen").generate({ type = "file" })
			end,
			desc = "Generate file doc with neogen",
		},
		{
			"<C-n>",
			"<cmd>lua require('neogen').jump_next<CR>",
			mode = "i",
			desc = "Jump to next placeholder",
		},
		{
			"<C-p>",
			"<cmd>lua require('neogen').jump_prev<CR>",
			mode = "i",
			desc = "Jump to next placeholder",
		},
	},
	opts = {
		enabled = true,
		input_after_comment = true,
		snippet_engine = "luasnip",
	},
	config = true,
}
