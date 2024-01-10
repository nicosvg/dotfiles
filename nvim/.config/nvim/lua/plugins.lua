return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Nvim Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons' -- optional, for file icons
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
    use({
	    "nvim-treesitter/nvim-treesitter-textobjects",
	    after = "nvim-treesitter",
	    requires = "nvim-treesitter/nvim-treesitter",
    })

    -- Color Schemes
    use 'joshdick/onedark.vim'
    use 'folke/tokyonight.nvim'
    use 'rainglow/vim'

    -- Vim Airline (status bar)
    use 'vim-airline/vim-airline'

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
       use { "williamboman/mason-lspconfig.nvim"}
    --use {"neovim/nvim-lspconfig"}

    -- Terminal integration
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	    require("toggleterm").setup({ })
    end}
end)
