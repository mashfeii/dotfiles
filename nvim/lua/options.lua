local cmd = vim.cmd -- execute Vim commands
-- local g = vim.g
local exec = vim.api.nvim_exec -- execute Vimscript
local opt = vim.opt -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- Icons
-----------------------------------------------------------
opt.list = true
opt.listchars = {
	space = " ",
	eol = "",
	tab = "▎ ",
	-- tab = "|_>",
	trail = ".",
	extends = "❯",
	precedes = "❮",
	nbsp = "",
}
opt.fillchars = {
	fold = " ",
	foldsep = " ",
	foldopen = "",
	foldclose = "",
	diff = "╱",
}
-----------------------------------------------------------
-- Global
-----------------------------------------------------------
opt.textwidth = 120
opt.cursorline = true
opt.spelllang = { "en_us", "ru" }
opt.number = true
opt.relativenumber = true
opt.so = 7 -- Cursor distance from windows border
opt.undofile = true -- Undo possibility
opt.splitright = true -- vertical split вправо
opt.splitbelow = true -- horizontal split вниз
opt.linebreak = true
opt.wrap = true
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "indent"
opt.termguicolors = true
opt.conceallevel = 2
-----------------------------------------------------------
-- Tabs and indets
-----------------------------------------------------------
cmd([[
filetype plugin on
syntax on
]])
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.fileencodings = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.smarttab = true
opt.wildignore = "*.out, *.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
opt.showcmd = true
opt.showmode = true
opt.wildmenu = true
opt.wildmode = "list:longest"
----------------------------------------------------------
-- Change light/dark colorscheme
-----------------------------------------------------------
local create_cmd = vim.api.nvim_create_user_command
create_cmd("ToggleBackground", function()
	if vim.o.background == "dark" then
		vim.cmd("set bg=light")
	else
		vim.cmd("set bg=dark")
	end
end, {})
create_cmd("RunGoRace", function()
	local function ends_with(str, ending)
		return ending == "" or str:sub(-#ending) == ending
	end
	local fullPath = vim.fn.expand("%:t")
	if ends_with(fullPath, ".go") then
		local fileName = fullPath:match("[^/]*.go$")
		require("toggleterm.terminal").Terminal
			:new({
				cmd = "go run -race " .. fileName,
				display_name = string.upper(fileName),
				direction = "float",
				float_opts = {
					border = "curved",
					title_pos = "center",
				},
				close_on_exit = false,
				auto_scroll = true,
			})
			:toggle()
		return
	end
end, {})
create_cmd("RunGo", function()
	local function ends_with(str, ending)
		return ending == "" or str:sub(-#ending) == ending
	end
	local fullPath = vim.fn.expand("%:t")
	if ends_with(fullPath, ".go") then
		local fileName = fullPath:match("[^/]*.go$")
		require("toggleterm.terminal").Terminal
			:new({
				cmd = "go run " .. fileName,
				display_name = string.upper(fileName),
				direction = "float",
				float_opts = {
					border = "curved",
					title_pos = "center",
				},
				close_on_exit = false,
				auto_scroll = true,
			})
			:toggle()
		return
	end
end, {})
create_cmd("CompileCPP", function()
	local function ends_with(str, ending)
		return ending == "" or str:sub(-#ending) == ending
	end
	local function get_file_name(file)
		return file:match("[^/]*.cpp$")
	end
	local fullPath = vim.fn.expand("%:t")

	if ends_with(fullPath, ".cpp") then
		local fileName = get_file_name(fullPath)
		local fileNameWithoutExtension = string.sub(fileName, 0, -5)
		require("toggleterm.terminal").Terminal
			:new({
				cmd = "g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 -o "
					.. fileNameWithoutExtension
					.. " "
					.. fileName
					.. " && ./"
					.. fileNameWithoutExtension,
				display_name = string.upper(fileName),
				direction = "float",
				float_opts = {
					border = "curved",
					title_pos = "center",
				},
				close_on_exit = false,
				auto_scroll = true,
			})
			:toggle()

		-- require("toggleterm").exec(
		--   "g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 -o "
		--   .. fileNameWithoutExtension
		--   .. " "
		--   .. fileName
		--   .. " && ./"
		--   .. fileNameWithoutExtension,
		--   1,
		--   12
		-- )
	end
end, {})
-----------------------------------------------------------
-- Fix for `tab` button
-----------------------------------------------------------
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*",
	callback = function()
		if
			((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
			and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require("luasnip").session.jump_active
		then
			require("luasnip").unlink_current()
		end
	end,
})
-----------------------------------------------------------
-- Customization for Pmenu
-----------------------------------------------------------
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
