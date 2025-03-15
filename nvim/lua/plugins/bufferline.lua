return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			vim.o.statusline = " "
		else
			vim.o.laststatus = 0
		end
	end,
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},
	opts = {
		highlights = {
			buffer_selected = { bold = true },
			diagnostic_selected = { bold = true },
			info_selected = { bold = true },
			info_diagnostic_selected = { bold = true },
			warning_selected = { bold = true },
			warning_diagnostic_selected = { bold = true },
			error_selected = { bold = true },
			error_diagnostic_selected = { bold = true },
		},
		options = {
			separator_style = "thin",
			offsets = {
				{
					filetype = "neo-tree",
					text = "NeoTree",
					highlight = "Directory",
					text_align = "center",
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
