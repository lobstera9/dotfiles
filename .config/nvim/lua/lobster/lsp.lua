-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, you should do some research.

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local builtin = require('telescope.builtin')

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = {buffer = event.buf}

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		--vim.keymap.set('n', 'gd', builtin.lsp_type_definitions, opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		--vim.keymap.set('n', 'gD', builtin.lsp_definitions, opts)
		--vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gr',builtin.lsp_references, opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set({'n','v'}, '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({'n','x','v'}, '<leader>af', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set({'n','v'}, '<leader>aa', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.keymap.set('n','gb',builtin.buffers,opts);
		-- Keymap to show diagnostic message under the cursor
		vim.keymap.set('n', '<leader>ae', vim.diagnostic.open_float, {
			desc = 'Show diagnostic message',
			noremap = true,
			silent = true,
		})
	end,
})

-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers. 
-- require('lspconfig').gleam.setup({})
-- require('lspconfig').rust_analyzer.setup({})
-- require('lspconfig').pyright.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
    ensure_installed = {'lua_ls', 'rust_analyzer', 'pyright', 'jdtls'},

    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

