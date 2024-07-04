return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		-- "mfussenegger/nvim-dap-python",
		"Pocco81/DAPInstall.nvim",
		"nvim-neotest/nvim-nio",
	},
	keys = {
		{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" } },
		{ "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Run or continue the debugger" } },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "127.0.0.1",
			port = 8123,
			executable = {
				command = "js-debug-adapter",
			},
		}

		for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
			dap.configurations[lang] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					runtimeExecutable = "node",
				},
			}
		end

		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.after.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.after.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
