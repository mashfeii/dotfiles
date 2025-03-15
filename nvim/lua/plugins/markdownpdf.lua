return {
	"arminveres/md-pdf.nvim",
	branch = "main",
	lazy = true,
	keys = {
		{
			"<leader>pdf",
			function()
				require("md-pdf").convert_md_to_pdf()
			end,
			desc = "Markdown preview",
		},
	},
	opts = {},
}
