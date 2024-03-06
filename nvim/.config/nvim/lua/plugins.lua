return require('packer').startup(function(use)
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Nvim Tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons' -- optional, for file icons
		}
	}

	-- Comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- Leap
	use 'ggandor/leap.nvim'

	-- Vim surround
	use 'tpope/vim-surround'

	-- Telescope
	use "nvim-lua/plenary.nvim"
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use {
		'fdschmidt93/telescope-egrepify.nvim',
		requires = { 'nvim-lua/telescope.nvim', 'nvim-lua/plenary.nvim' }
	}

	-- Better escape
	use {
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end
	}

	-- LSP zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}


	-- LSP config
	use 'neovim/nvim-lspconfig'

	-- TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- Color Schemes
	use 'joshdick/onedark.vim'
	use 'folke/tokyonight.nvim'
	use 'rainglow/vim'
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Status bar
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Tmux navigator
	use 'christoomey/vim-tmux-navigator'

	-- Autotag
	use 'windwp/nvim-ts-autotag'

	-- Autosave
	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {
				-- your config goes here
				-- or just leave it empty :)
			}
		end,
	})

	-- Mason (packages manager)
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	--use {"neovim/nvim-lspconfig"}

	-- Terminal integration
	-- use { "akinsho/toggleterm.nvim", tag = '*', config = function()
	-- 	require("toggleterm").setup({})
	-- end }

	-- Smooth scroll
	use 'karb94/neoscroll.nvim'

	-- Fancy start screen
	use 'mhinz/vim-startify'

	-- Autosession
	use 'rmagatti/auto-session'
end)
