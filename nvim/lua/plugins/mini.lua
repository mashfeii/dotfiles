return {
	{
		"echasnovski/mini.comment",
		version = "*",
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{ "echasnovski/mini.clue", version = "*" },
	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{ "echasnovski/mini.icons", version = "*" },
	{
		"echasnovski/mini.surround",
		version = "*",
		init = function()
			require("mini.surround").setup()
		end,
	},
}
