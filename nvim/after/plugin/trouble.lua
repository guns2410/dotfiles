require("trouble").setup {
    icons = true,
    mode = "workspace_diagnostics",
}

        -- vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, remap = false })
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble" })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Toggle workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Toggle document diagnostics" })
vim.keymap.set("n", "<leader>xf", function() require("trouble").toggle("quickfix") end, { desc = "Toggle quickfix" })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Toggle loclist" })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Toggle lsp references" })

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
    defaults = {
        mappings = {
            i = { ["<c-h>"] = trouble.open_with_trouble },
            n = { ["<c-h>"] = trouble.open_with_trouble },
        },
    },
}
