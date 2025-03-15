return {
	"Civitasv/cmake-tools.nvim",
	config = function()
		local osys = require("cmake-tools.osys")
		require("cmake-tools").setup({
			cmake_command = "cmake",
			ctest_command = "ctest",
			cmake_use_preset = true,
			cmake_regenerate_on_save = true,
			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
			cmake_build_options = {},
			cmake_build_directory = function()
				if osys.iswin32 then
					return "build\\"
				end
				return "./build/"
			end,
			cmake_soft_link_compile_commands = true,
			cmake_compile_commands_from_lsp = false,
			cmake_kits_path = nil,
			cmake_variants_message = {
				short = { show = true },
				long = { show = true, max_length = 40 },
			},
			cmake_dap_configuration = {
				name = "cpp",
				type = "codelldb",
				request = "launch",
				stopOnEntry = false,
				runInTerminal = true,
				console = "toggleterm",
			},
			cmake_executor = {
				name = "toggleterm",
				opts = {
					direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
					close_on_exit = false, -- whether close the terminal when exit
					auto_scroll = true, -- whether auto scroll to the bottom
					singleton = true, -- single instance, autocloses the opened one, if present
				}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
			},
			cmake_runner = { -- runner to use
				name = "toggleterm", -- name of the runner
				opts = {
					direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
					close_on_exit = false, -- whether close the terminal when exit
					auto_scroll = true, -- whether auto scroll to the bottom
					singleton = true, -- single instance, autocloses the opened one, if present
				}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
			},
			cmake_notifications = {
				runner = { enabled = true },
				executor = { enabled = true },
				spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
				refresh_rate_ms = 100, -- how often to iterate icons
			},
			cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
		})
	end,
}
