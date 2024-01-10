return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>ggs", ":Git<CR>", { noremap = true, silent = true } },
		{ "<leader>ggd", ":Gdiff<CR>", { noremap = true, silent = true } },
		{ "<leader>ggb", ":Git blame<CR>", { noremap = true, silent = true } },
		{ "<leader>ggl", ":Glog<CR>", { noremap = true, silent = true } },
		{ "<leader>ggp", ":Gpull<CR>", { noremap = true, silent = true } },
		{ "<leader>ggP", ":Gpush<CR>", { noremap = true, silent = true } },
		{ "<leader>ggS", ":Gstatus<CR>", { noremap = true, silent = true } },
		{ "<leader>ggR", ":Gread<CR>", { noremap = true, silent = true } },
	},
}
