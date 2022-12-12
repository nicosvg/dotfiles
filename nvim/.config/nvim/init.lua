require('plugins')

vim.g.mapleader = ' '

-- Nvim Tree

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set color scheme
vim.cmd('colorscheme onedark')

-- setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {{
                key = "u",
                action = "dir_up"
            }}
        }
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    }
})

-- Keys
local key_mapper = function(mode, key, result)
    vim.keymap.set(mode, key, result, {
        noremap = true,
        silent = true
    })
end
-- NvimTree
key_mapper('n', '<c-n>', '<cmd> NvimTreeToggle <CR>')
key_mapper('n', '<leader>e', '<cmd> NvimTreeFocus <CR>')
-- Reload config
key_mapper('n', '<leader>rc', '<cmd> source $MYVIMRC <CR>')
-- Packer
key_mapper('n', '<leader>ps', '<cmd> PackerSync <CR>')
-- Telescope
local builtin = require('telescope.builtin')
key_mapper('n', '<leader>ff', builtin.find_files)
key_mapper('n', '<leader>fa', builtin.live_grep)
key_mapper('n', '<leader>fb', builtin.buffers)
key_mapper('n', '<leader>fh', builtin.help_tags)
key_mapper('n', '<leader>fr', builtin.lsp_references)

--Telescope
require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

-- Better escape
require("better_escape").setup {
    mapping = {"jk", "jj"}, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
}

-- Leap
require('leap').add_default_mappings()

-- LSP
require'lspconfig'.tsserver.setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" }
}

require('nvim-ts-autotag').setup()

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
