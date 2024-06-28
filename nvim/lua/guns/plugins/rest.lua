return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		enabled = false,
		dependencies = { "luarocks.nvim" },
		keys = {
			{ "<leader>rrc", "<cmd>Rest run<CR>", { silent = true, desc = "[Rest] Current Buffer" } },
			{ "<leader>rrl", "<cmd>Rest run last<CR>", { silent = true, desc = "[Rest] Re-run last" } },
			{ "<leader>rrp", "<Plug>RestNvimPreview<CR>", { silent = true, desc = "[Rest] Copy curl to clipboard" } },
		},
		config = function()
			local default_config = {
				client = "curl",
				env_file = ".env",
				env_pattern = "\\.env$",
				env_edit_command = "tabedit",
				encode_url = true,
				skip_ssl_verification = false,
				custom_dynamic_variables = {},
				logs = {
					level = "info",
					save = true,
				},
				result = {
					split = {
						horizontal = true,
						in_place = false,
						stay_in_current_window_after_split = true,
					},
					behavior = {
						decode_url = true,
						show_info = {
							url = true,
							headers = true,
							http_info = true,
							curl_command = true,
						},
						statistics = {
							enable = true,
							---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
							stats = {
								{ "total_time", title = "Time taken:" },
								{ "size_download_t", title = "Download size:" },
							},
						},
						formatters = {
							json = "jq",
							html = function(body)
								if vim.fn.executable("tidy") == 0 then
									return body, { found = false, name = "tidy" }
								end
								local fmt_body = vim.fn
									.system({
										"tidy",
										"-i",
										"-q",
										"--tidy-mark",
										"no",
										"--show-body-only",
										"auto",
										"--show-errors",
										"0",
										"--show-warnings",
										"0",
										"-",
									}, body)
									:gsub("\n$", "")

								return fmt_body, { found = true, name = "tidy" }
							end,
						},
					},
				},
				highlight = {
					enable = true,
					timeout = 750,
				},
			}
			require("rest-nvim").setup(default_config)
		end,
	},
}
-- return {
-- 	{
-- 		"vhyrro/luarocks.nvim",
-- 		opts = {
-- 			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
-- 			install = {
-- 				missing = true,
-- 			},
-- 		},
-- 	},
-- 	{
-- 		"rest-nvim/rest.nvim",
-- 		ft = "http",
-- 		dependencies = { "luarocks.nvim" },
-- 		keys = {
-- 			{ "<leader>rrc", "<cmd>Rest run<CR>", { silent = true, desc = "[Rest] Current Buffer" } },
-- 			{ "<leader>rrl", "<cmd>Rest run last<CR>", { silent = true, desc = "[Rest] Re-run last" } },
-- 			{ "<leader>rrp", "<Plug>RestNvimPreview<CR>", { silent = true, desc = "[Rest] Copy curl to clipboard" } },
-- 		},
-- 	},
-- opts = {
-- 	client = "curl",
-- 	env_file = ".env",
-- 	env_pattern = "\\.env$",
-- 	env_edit_command = "tabedit",
-- 	encode_url = true,
-- 	skip_ssl_verification = false,
-- 	custom_dynamic_variables = {},
-- 	logs = {
-- 		level = "info",
-- 		save = true,
-- 	},
-- 	highlight = {
-- 		enable = true,
-- 		timeout = 750,
-- 	},
-- 	result = {
-- 		split = {
-- 			in_place = false,
-- 			horizontal = false,
-- 			stay_in_current_window_after_split = true,
-- 		},
-- 		behavior = {
-- 			decode_url = true,
-- 			show_info = {
-- 				url = true,
-- 				headers = true,
-- 				http_info = true,
-- 				curl_command = true,
-- 			},
-- 			formatters = {
-- 				json = "jq",
-- 				html = function(body)
-- 					if vim.fn.executable("tidy") == 0 then
-- 						return body, { found = false, name = "tidy" }
-- 					end
-- 					local fmt_body = vim.fn
-- 						.system({
-- 							"tidy",
-- 							"-i",
-- 							"-q",
-- 							"--tidy-mark",
-- 							"no",
-- 							"--show-body-only",
-- 							"auto",
-- 							"--show-errors",
-- 							"0",
-- 							"--show-warnings",
-- 							"0",
-- 							"-",
-- 						}, body)
-- 						:gsub("\n$", "")
--
-- 					return fmt_body, { found = true, name = "tidy" }
-- 				end,
-- 			},
-- 		},
-- 	},
-- 	keybinds = {
-- 		{ "<localleader>rr", "<cmd>Rest run<cr>", "Run request under the cursor" },
-- 		{ "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request" },
-- 	},
-- },
-- }
