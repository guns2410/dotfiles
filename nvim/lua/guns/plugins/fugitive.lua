return {
	"tpope/vim-fugitive",
	dependencies = {
		"tpope/vim-rhubarb",
	},
	keys = {
		{ "<leader>ggs", ":Git<CR>", { noremap = true, silent = true } },
		{ "<leader>ggd", ":Gdiff<CR>", { noremap = true, silent = true } },
		{ "<leader>ggb", ":Git blame<CR>", { noremap = true, silent = true } },
		{ "<leader>ggp", ":Gpull<CR>", { noremap = true, silent = true } },
		{ "<leader>ggP", ":Gpush<CR>", { noremap = true, silent = true } },
		{ "<leader>ggS", ":Gstatus<CR>", { noremap = true, silent = true } },
		{ "<leader>ggR", ":Gread<CR>", { noremap = true, silent = true } },
		{ "<leader>ggf", ":Git log -p --follow -- %<CR>", { noremap = true, silent = true } },
		{ "<leader>ggB", ":GBrowse<CR>", { noremap = true, silent = true } },
	},
	config = function()
		local fugitive = require("fugitive")
		fugitive.setup({
			-- custom configuration here
		})
	end,
}
