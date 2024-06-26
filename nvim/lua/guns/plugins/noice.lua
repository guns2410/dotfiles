return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>mo",
			"<cmd>Telescope noice<CR>",
			{ desc = "Open noice" },
		},
		{
			"<leader>mc",
			"<cmd>Noice dismiss<CR>",
			{ desc = "Dismiss noice" },
		},
	},
	config = function()
		local filter = {
			event = "msg_show",
			["not"] = {
				kind = { "inlay_hint", "inlayhint", "Inlay Hints" },
			},
		}
		require("noice").setup({
			background_color = "#000000",
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				lsp_doc_border = true,
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
			},
			-- filter out inlay hints
			routes = {
				{ filter = filter, opts = { skip = true } },
			},
		})
		require("telescope").load_extension("noice")
	end,
}
