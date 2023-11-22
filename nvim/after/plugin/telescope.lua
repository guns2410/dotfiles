require("telescope").setup {
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        buffers = {
            theme = "dropdown",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>o", require("telescope.builtin").oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set("n", "<leader>O", require("telescope.builtin").buffers, { desc = '[?] Find recently opened buffers' })

vim.keymap.set("n", "<leader>/", function()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>lg", require("telescope.builtin").live_grep, { desc = "[L]ive [G]rep" })
vim.keymap.set("n", "<leader>bb", require("telescope.builtin").buffers, { desc = "[B]uffers [B]uffer" })
vim.keymap.set("n", "<leader>bf", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "[B]uffers [F]uzzy" })
vim.keymap.set("n", "<leader>bh", require("telescope.builtin").oldfiles, { desc = "[B]uffers [H]istory" })

require('telescope').load_extension('fzf')
