return {
	"AlejandroSuero/freeze-code.nvim",
	config = function()
		require("freeze-code").setup({
			copy = true,
      copy_cmd = "xclip -selection clipboard -t image/png ~/Pictures/Screenshots/freeze.png",
			dir = vim.fn.expand("$HOME/Pictures/Screenshots/"),
			freeze_config = {
        config = "user",
        theme = "dracula"
			},
		})
		local fz_api = require("freeze-code.utils.api")
		vim.keymap.set("n", "<leader>fz", fz_api.freeze)
		vim.keymap.set("v", "<leader>fz", function()
			fz_api.freeze(vim.fn.line("'<"), vim.fn.line("'>"))
		end)
		-- or using `<cmd>Freeze<cr>`
		vim.keymap.set("n", "<leader>fl", fz_api.freeze_line)
		-- or using `<cmd>FreezeLine<cr>`
	end,
}
