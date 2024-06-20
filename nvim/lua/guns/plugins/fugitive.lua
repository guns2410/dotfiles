return {
	"tpope/vim-fugitive",
	dependencies = {
		"tpope/vim-rhubarb",
	},
	keys = {
		{ "<leader>ggs", ":Git<CR>", { noremap = true, silent = true, desc = "Show Fugitive Git window" } },
		{ "<leader>ggd", ":Gdiff<CR>", { noremap = true, silent = true, desc = "Show git diff" } },
		{ "<leader>ggb", ":Git blame<CR>", { noremap = true, silent = true, desc = "Git blame" } },
		{ "<leader>ggp", ":Gpull<CR>", { noremap = true, silent = true, desc = "Git pull" } },
		{ "<leader>ggP", ":Gpush<CR>", { noremap = true, silent = true, desc = "Git push" } },
		{ "<leader>ggS", ":Gstatus<CR>", { noremap = true, silent = true, desc = "Git status" } },
		{ "<leader>ggR", ":Gread<CR>", { noremap = true, silent = true, desc = "Git read" } },
		{ "<leader>ggf", ":Git log -p --follow -- %<CR>", { noremap = true, silent = true, desc = "Git log" } },
		{ "<leader>ggB", ":GBrowse<CR>", { noremap = true, silent = true, desc = "Git browse in an Browser" } },
		{ "<leader>ggy", ":GBrowse!<CR>", { noremap = true, silent = true, desc = "Git browse in clipboard" } },
	},
	config = function()
		vim.api.nvim_create_user_command("Browse", function(opts)
			vim.fn.system({ "open", opts.fargs[1] })
		end, { nargs = 1 })
	end,
}
