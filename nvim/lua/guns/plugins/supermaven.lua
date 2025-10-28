return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			log_level = "info", -- set to "off" to disable logging completely
			-- disable_inline_completion = false, -- disables inline completion for use with cmp
		})
	end,
}
