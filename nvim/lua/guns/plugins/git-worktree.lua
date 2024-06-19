return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>gw",
			"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
			{ desc = "Git worktrees" },
		},
		{
			"<leader>gc",
			"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
			{ desc = "Create git worktree" },
		},
		{
			"<leader>gd",
			"<cmd>lua require('telescope').extensions.git_worktree.delete_git_worktree()<CR>",
			{ desc = "Delete git worktree" },
		},
	},
	config = function()
		require("git-worktree").setup()
		require("telescope").load_extension("git_worktree")
	end,
}
