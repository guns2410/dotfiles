require('mason').setup()
local autogroup = vim.api.nvim_create_augroup("LSPFormatting", {})
local lsp = require("lsp-zero")

require('mason-lspconfig').setup({
    ensure_installed = { "tsserver", "eslint", "rust_analyzer", "gopls", "biome" },
    handlers = {
        lsp.default_setup,
        tsserver = function()
            require("lspconfig").tsserver.setup({
                single_file_support = false,
                on_attach = function(client, bufnr)
                    client.resolved_capabilities.document_formatting = false
                    on_attach(client, bufnr)
                end
            })
        end,
    },
})

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "rust_analyzer",
    "gopls",
    "biome"
})

-- Fix Undefined global "vim"
lsp.nvim_workspace()

local function allow_format(servers)
    return function(client) return vim.tbl_contains(servers, client.name) end
end

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    }
})

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    lsp.default_keymaps({ buffer = bufnr })

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gl', vim.diagnostic.open_float, '[G]oto [E]ymbol')
    nmap('gn', vim.diagnostic.goto_next, '[G]oto [N]ext Diagnostic')
    nmap('gp', vim.diagnostic.goto_prev, '[G]oto [P]revious Diagnostic')
    nmap('<leader>wwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
    -- nmap('<leader>f', vim.lsp.buf.format({ async = false, timeout_ms = 10000 }), '[F]ormat Buffer')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    vim.api.nvim_clear_autocmds({ group = autogroup, buffer = bufnr })
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --     group = autogroup,
    --     buffer = bufnr,
    --     callback = function()
    --         vim.lsp.buf.format({
    --             async = false,
    --             timeout_ms = 10000,
    --             filter = allow_format({ "tsserver", "eslint", "rust_analyzer", "gopls", "biome" })
    --         })
    --     end
    -- })
end

lsp.on_attach(on_attach)
lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

lsp.format_mapping('<leader>f', {
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['tsserver'] = { 'javascript', 'typescript' },
        ['rust_analyzer'] = { 'rust' },
    }
})
