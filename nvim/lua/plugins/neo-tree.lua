return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal right toggle<CR>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right toggle<CR>", {})

		require("neo-tree").setup({
			default_component_configs = {
				icon = {
					provider = function(icon, node, state)
						local success, mini_icons = pcall(require, "mini.icons")
						if success then
							local devicon, hl = mini_icons.get(node.type, node.name)
							icon.text = devicon or icon.text
							icon.highlight = hl or icon.highlight
						end
					end,
				},
			},
		})

		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
	end,
}
