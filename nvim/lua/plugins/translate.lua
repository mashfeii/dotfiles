return {
	"uga-rosa/translate.nvim",
	config = function()
		vim.keymap.set("v", "<leader>trru", ":Translate RU<cr>", { noremap = true, silent = true })
		vim.keymap.set("v", "<leader>tren", ":Translate EN<cr>", { noremap = true, silent = true })
	end,
}
