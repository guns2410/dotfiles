return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		enabled = true,
		dependencies = { "luarocks.nvim" },
		keys = {
			{ "<leader>rrc", "<cmd>Rest run<CR>", { silent = true, desc = "[Rest] Current Buffer" } },
			{ "<leader>rrl", "<cmd>Rest run last<CR>", { silent = true, desc = "[Rest] Re-run last" } },
			{ "<leader>rrp", "<Plug>RestNvimPreview<CR>", { silent = true, desc = "[Rest] Copy curl to clipboard" } },
		},
		config = function()
			---rest.nvim default configuration
			---@class rest.Config
			local default_config = {
				---@type table<string, fun():string> Table of custom dynamic variables
				custom_dynamic_variables = {},
				---@class rest.Config.Request
				request = {
					---@type boolean Skip SSL verification, useful for unknown certificates
					skip_ssl_verification = false,
					---Default request hooks
					---@class rest.Config.Request.Hooks
					hooks = {
						---@type boolean Encode URL before making request
						encode_url = true,
						---@type string Set `User-Agent` header when it is empty
						user_agent = "rest.nvim v" .. require("rest-nvim.api").VERSION,
						---@type boolean Set `Content-Type` header when it is empty and body is provided
						set_content_type = true,
					},
				},
				---@class rest.Config.Response
				response = {
					---Default response hooks
					---@class rest.Config.Response.Hooks
					hooks = {
						---@type boolean Decode the request URL segments on response UI to improve readability
						decode_url = true,
						---@type boolean Format the response body using `gq` command
						format = true,
					},
				},
				---@class rest.Config.Clients
				clients = {
					---@class rest.Config.Clients.Curl
					curl = {
						---Statistics to be shown, takes cURL's `--write-out` flag variables
						---See `man curl` for `--write-out` flag
						---@type RestStatisticsStyle[]
						statistics = {
							{ id = "time_total", winbar = "take", title = "Time taken" },
							{ id = "size_download", winbar = "size", title = "Download size" },
						},
						---Curl-secific request/response hooks
						---@class rest.Config.Clients.Curl.Opts
						opts = {
							---@type boolean Add `--compressed` argument when `Accept-Encoding` header includes
							---`gzip`
							set_compressed = false,
							---@type table<string, Certificate> Table containing certificates for each domains
							certificates = {},
						},
					},
				},
				---@class rest.Config.Cookies
				cookies = {
					---@type boolean Whether enable cookies support or not
					enable = true,
					---@type string Cookies file path
					path = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rest-nvim.cookies"),
				},
				---@class rest.Config.Env
				env = {
					---@type boolean
					enable = true,
					---@type string
					pattern = ".*%.env.*",
					---@type fun():string[]
					find = function()
						local config = require("rest-nvim.config")
						return vim.fs.find(function(name, _)
							return name:match(config.env.pattern)
						end, {
							path = vim.fn.getcwd(),
							type = "file",
							limit = math.huge,
						})
					end,
				},
				---@class rest.Config.UI
				ui = {
					---@type boolean Whether to set winbar to result panes
					winbar = true,
					---@class rest.Config.UI.Keybinds
					keybinds = {
						---@type string Mapping for cycle to previous result pane
						prev = "H",
						---@type string Mapping for cycle to next result pane
						next = "L",
					},
				},
				---@class rest.Config.Highlight
				highlight = {
					---@type boolean Whether current request highlighting is enabled or not
					enable = true,
					---@type number Duration time of the request highlighting in milliseconds
					timeout = 750,
				},
				---@see vim.log.levels
				---@type integer log level
				_log_level = vim.log.levels.WARN,
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
