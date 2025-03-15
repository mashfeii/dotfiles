local map = vim.api.nvim_set_keymap
local keymap = vim.keymap
local default_opts = { noremap = true, silent = true }
-- Системный буфер обмена shift - Y
map("v", "S-Y", '"+y', {})
-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
map("i", "jj", "<Esc>", { noremap = true })
-- Автоформат + сохранение по CTRL-s , как в нормальном, так и в insert режиме
keymap.set("i", "<C-s>", function()
	vim.lsp.buf.format()
	vim.api.nvim_command("write")
end, default_opts)
keymap.set("n", "<C-s>", function()
	vim.lsp.buf.format()
	vim.api.nvim_command("write")
end, default_opts)
keymap.set("n", "<leader>f", vim.lsp.buf.format, default_opts)
keymap.set("n", "<leader>em", vim.diagnostic.open_float, default_opts)
-- Go to start or end of line
keymap.set({ "n", "x" }, "<leader>h", "^")
keymap.set({ "n", "x" }, "<leader>l", "$")
keymap.set("n", "<c-j>", "<c-w>j", default_opts)
keymap.set("n", "<c-h>", "<c-w>h", default_opts)
keymap.set("n", "<c-k>", "<c-w>k", default_opts)
keymap.set("n", "<c-l>", "<c-w>l", default_opts)
-- Swap lines
keymap.set("n", "<A-Down>", "ddp", default_opts)
keymap.set("n", "<A-Up>", "<Up>ddp<Up>", default_opts)
-- Copy entire buffer.
keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })
map("n", "<leader>note", ":cd ~/.notes/<cr>", default_opts)
map("n", "<leader>code", ":cd ~/.codes/<cr>", default_opts)
-- По F1 очищаем последний поиск с подсветкой
map("n", "<F1>", ":nohl<CR>", default_opts)
-- shift + F1 = удалить пустые строки
map("n", "<F13>", ":g/^$/d<CR>", default_opts)
-- ";"Q - save all and quit
map("n", "<leader>Q", ":wqa<cr>", default_opts)
map("n", "<leader>q", "<C-w>q", default_opts)
map("n", "<leader>w", ":w<cr>", default_opts)
map("n", "<leader>bg", ":ToggleBackground<cr>", default_opts)
-- <F4> Поиск слова под курсором
map("n", "<F4>", [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Поиск слова в модальном окошке
map("n", "<F16>", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-- <F5>,<F9> Compile and run C/CPP program
map("n", "<F5>", ":call CompileAndRun()<CR>", default_opts)
map("n", "<A-n>", ":CompileCPP<cr>", default_opts)
map("n", "<F9>", ":w<CR>:!clear<CR>:call CompileAndRun()<CR>", default_opts)
map("n", "<leader>gc", ":RunGoRace<cr>", default_opts)
map("n", "<leader>gr", ":RunGo<cr>", default_opts)

map("n", "<leader>cg", ":CMakeGenerate<cr>", default_opts)
map("n", "<leader>cb", ":CMakeBuild<cr>", default_opts)
map("n", "<leader>cf", ":CMakeRunCurrentFile<cr>", default_opts)
map("n", "<leader>cr", ":CMakeRun<cr>", default_opts)
map("n", "<leader>cc", ":CMakeClean<cr>", default_opts)
map("n", "<leader>T", ":ToggleTerm <cr>", default_opts)

map("n", "<leader>ct", ":CodeiumToggle<cr>", default_opts)

map("n", "<leader>got", ":GoTestAdd<cr>", default_opts)
map("n", "<leader>gote", ":GoTestsExp<cr>", default_opts)

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	keymap.set("t", "jj", [[<C-\><C-n>]], { noremap = true })
	keymap.set("t", "<leader>q", [[<C-\><C-n>]], opts)
	keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
