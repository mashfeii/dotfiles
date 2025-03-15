return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
  config = function()
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_browser = '/usr/bin/brave'
  end
}
