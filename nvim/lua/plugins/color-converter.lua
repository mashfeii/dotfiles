return {
	"austinwilcox/hex2rgba",
	config = function()
		local map = vim.api.nvim_set_keymap
		map("n", "<leader>cs", ':lua require("hex2rgba").hex2rgba()<cr>', { noremap = true })
	end,
}
