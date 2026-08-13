return {
	-- {"mason-org/mason.nvim",opts={}},
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts={},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		view_options={
			show_hidden = true,
			is_hidden_file = function(name, bufnr)
				return vim.startswith(name, ".")
			end,
		},
	},
	{ "EdenEast/nightfox.nvim" }, -- lazy
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { 'nvim-lua/plenary.nvim' }
	},
	{"mfussenegger/nvim-jdtls"},
	{'nvim-tree/nvim-web-devicons'},
	{"f-person/git-blame.nvim"},
	-- LSP Support
	{ "neovim/nvim-lspconfig"},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	{"VonHeikemen/lsp-zero.nvim"},
	{"nvim-telescope/telescope-ui-select.nvim"},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{'akinsho/toggleterm.nvim', version = "*", config = true}


}
