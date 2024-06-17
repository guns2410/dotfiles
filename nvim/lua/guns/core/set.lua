vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.mouse = "a"
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
vim.opt.cc = ""

vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set_cursor = function()
	vim.api.nvim_exec(
		[[
        augroup Cursor
            autocmd!
            autocmd InsertEnter * set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
            autocmd InsertLeave * set guicursor=n-v-c:block-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
        augroup END
    ]],
		false
	)
end

set_cursor()

vim.tbl_add_reverse_lookup = function(tbl)
	for k, v in pairs(tbl) do
		tbl[v] = k
	end
end
