-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#4b5263 ]])

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                },
                folder = {
                    default = "",
                    open = "",
                    symlink = "",
                },
            },
        },
    },
    actions = {
        open_file = {
            window_picker = { enable = false }
        }
    }
})

vim.keymap.set("n", "<leader>1", ":NvimTreeToggle<CR>", {
    noremap = true,
    silent = true,
})

vim.keymap.set("n", "<leader>ff", ":NvimTreeFindFile<CR>", {
    noremap = true,
    silent = true,
})

vim.keymap.set("n", "<leader>fr", ":NvimTreeRefresh<CR>", {
    noremap = true,
    silent = true,
})
