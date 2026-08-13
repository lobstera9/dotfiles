-- nightfox colorscheme setup
require("nightfox")
vim.cmd("colorscheme carbonfox")

-- telescope defaults
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', function()
builtin.grep_string({search = vim.fn.input("Grep > ")});end);

-- git blame setup
require('gitblame').setup{
  enabled=true
}
require('lobster.lsp')

-- telescope ui setup
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
require("telescope").load_extension("ui-select")

-- ToggelTerm Setup
require('toggleterm').setup{
	size=20,
	direction = 'float',
	float_opts = {
		border = 'curved',
		title_pos= 'center'
	}
}

