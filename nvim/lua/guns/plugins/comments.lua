return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				toggler = {
					line = "<leader>cc",
					block = "<leader>cb",
				},
				opleader = {
					line = "<leader>c",
					block = "<leader>cb",
				},
				extra = {
					above = "<leader>cO",
					below = "<leader>co",
					eol = "<leader>cA",
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
