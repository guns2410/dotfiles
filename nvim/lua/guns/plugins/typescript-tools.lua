return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	enabled = true,
	config = function()
		local function organize_imports()
			local params = {
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(0) },
			}
			vim.lsp.buf.execute_command(params)
		end
		vim.keymap.set("n", "<leader>gi", organize_imports)
		require("typescript-tools").setup({
			settings = {
				separate_diagnostic_server = true,
				code_lens = "off",
				jsx_close_tag = {
					enable = false,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
				on_attach = function(client)
					client.server_capabilities.semanticTokensProvider = true
				end,
				javascript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					},
				},
				typescript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					},
				},
			},
		})
	end,
}
