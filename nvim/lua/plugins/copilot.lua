return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_workspace_folders = {
			"/home/mashfeii/go-workspace/github.com/mashfeii/backend-academy/link-gopher",
			"/home/mashfeii/go-workspace/github.com/mashfeii/backend-academy/maze",
			"/home/mashfeii/go-workspace/github.com/mashfeii/backend-academy/logger",
			"/home/mashfeii/go-workspace/github.com/mashfeii/backend-academy/fractal-flame",
			"/home/mashfeii/go-workspace/github.com/mashfeii/backend-academy/hangame",
			"/home/mashfeii/go-workspace/github.com/mashfeii/backend-academy/benchmarking",
		}
	end,
	-- "Exafunction/codeium.vim",
	-- event = "BufEnter",
	-- config = function()
	--   vim.keymap.set("i", "<C-g>", function()
	--     return vim.fn["codeium#Accept"]()
	--   end, { expr = true, silent = true })
	--   vim.keymap.set("i", "<C-]>", function()
	--     return vim.fn["codeium#CycleCompletions"](1)
	--   end, { expr = true, silent = true })
	--   vim.keymap.set("i", "<C-[>", function()
	--     return vim.fn["codeium#CycleCompletions"](-1)
	--   end, { expr = true, silent = true })
	--   vim.keymap.set("i", "<C-c>", function()
	--     return vim.fn["codeium#Clear"]()
	--   end, { expr = true, silent = true })
	-- end,
}
