return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	enabled = true,
	config = function()
		require("typescript-tools").setup({
			settings = {
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
				-- javascript = {
				-- 	inlayHints = {
				-- 		includeInlayEnumMemberValueHints = true,
				-- 		includeInlayFunctionLikeReturnTypeHints = true,
				-- 		includeInlayFunctionParameterTypeHints = true,
				-- 		includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				-- 		includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				-- 		includeInlayPropertyDeclarationTypeHints = true,
				-- 		includeInlayVariableTypeHints = true,
				-- 		includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				-- 	},
				-- },
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
