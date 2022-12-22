return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Nvim Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons' -- optional, for file icons
        }
    }

    -- Leap
    use 'ggandor/leap.nvim'

    -- Vim surround
    use 'tpope/vim-surround'

    -- Telescope
    use "nvim-lua/plenary.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- Better escape
    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end
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

    -- Color Schemes
    use 'joshdick/onedark.vim'

    -- Vim Airline (status bar)
    use 'vim-airline/vim-airline'

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
end)
