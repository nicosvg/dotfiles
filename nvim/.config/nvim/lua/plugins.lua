return {
	-- Nvim Tree
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' -- optional, for file icons
		}
	},
	-- Comment
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	-- Vim surround
	'tpope/vim-surround',

	-- Telescope
	{
		'fdschmidt93/telescope-egrepify.nvim',
		requires = { 'nvim-lua/telescope.nvim', 'nvim-lua/plenary.nvim' }
	},


	-- LSP zero
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			-- cSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	},

	-- LSP config
	'neovim/nvim-lspconfig',

	-- TreeSitter
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", }
	},

	-- Color Schemes
	'joshdick/onedark.vim',
	'folke/tokyonight.nvim',
	'rainglow/vim',
	{ "catppuccin/nvim", as = "catppuccin" },

	-- Status bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
	},

	-- Tmux navigator
	'christoomey/vim-tmux-navigator',

	-- Autotag
	'windwp/nvim-ts-autotag',

	-- Autosave
	{
		"Pocco81/auto-save.nvim",
		enabled = false,
		config = function()
			require("auto-save").setup {
				trigger_events = { "InsertLeave" },
				debounce_delay = 500,
				execution_message = {
					message = function() -- message to print on save
						return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
					end,
					dim = 0.18, -- dim the color of `message`
					cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
				},
			}
		end,
	},

	-- Mason (packages manager)
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- Smooth scroll
	'karb94/neoscroll.nvim',

	-- mini.nvim
	'echasnovski/mini.nvim'
}
