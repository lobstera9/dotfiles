vim.g.mapleader=" "
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n","<leader>-",vim.cmd.Ex)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- ToggleTerm key maps

-- opens terminal in normal visual and 'x' mode
vim.keymap.set({'n','v','x'},'<leader>at','<CMD>ToggleTerm<CR>')
-- escapes the insert mode in terminal
vim.keymap.set('t','<esc>',[[<C-\><C-n>]])
-- escaping the terminal 
function _G.set_terminal_keymaps()
	vim.keymap.set('t','<esc>',[[<C-\><C-n>]])
	vim.keymap.set({'n','v','x'},'<leader>at','<CMD>ToggleTerm<CR>')
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()');

