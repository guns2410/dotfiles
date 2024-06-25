vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>ggu", '<cmd>silent !tmux neww -c "$PWD" lazygit<CR>')
vim.keymap.set("n", "<leader>ggl", '<cmd>silent !tmux neww -c "$PWD" lazygit -f "$PWD"<CR>')
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

vim.keymap.set("n", "<leader>ggh", function()
	local filePath = vim.fn.expand("%:p") -- Get the full path of the current file
	print(filePath)
	vim.cmd('silent !tmux neww -c "$PWD" lazygit -f "' .. filePath .. '"')
end, { silent = true })

vim.keymap.set("n", "dp", "Vyp")
vim.keymap.set("n", "dP", "VyP")

vim.keymap.set("n", "<C-s>", ":wa<CR>")
