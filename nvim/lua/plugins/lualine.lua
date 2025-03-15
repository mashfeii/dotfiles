return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "archibate/lualine-time" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = false,
				component_separators = "",
				section_separators = "",
				theme = "gruvbox-material",
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {
					"filename",
					"diff",
				},
				lualine_c = {
					"%=",
					"ctime",
					function()
						return require("pomodoro").get_pomodoro_status("", "", "")
					end,
				},
				lualine_x = {
					"fileformat",
					"filetype",
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							error = { fg = "#ea6962" },
							warn = { fg = "#d8a657" },
							info = { fg = "#a9b665" },
						},
					},
				},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = { "neo-tree", "lazy", "quickfix" },
		})
	end,
}
