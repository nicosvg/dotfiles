require('plugins')

vim.g.mapleader = ' '
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

-- Nvim Tree

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set color scheme
vim.cmd('colorscheme tokyonight')

-- setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
	},
	renderer = {
		group_empty = true
	},
	filters = {
		dotfiles = false
	},
	git = {ignore = false}
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
key_mapper('n', '<leader>gr', builtin.lsp_references)
key_mapper('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols)
-- Terminal
key_mapper('n', '<c-h>', '<cmd> ToggleTerm <CR>')

--Telescope
require "telescope".setup {
	pickers = {
		colorscheme = {
			enable_preview = true
		},
		find_files = {
			hidden = true
		} 
	}
}

-- LSP keymaps
key_mapper('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')

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
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
	autotag = {
		enable = true,
	},
	--Text Objects
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				-- You can optionally set descriptions to the mappings (used in the desc parameter of
				-- nvim_buf_set_keymap) which plugins like which-key display
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				-- You can also use captures from other query groups like `locals.scm`
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				--		['@parameter.outer'] = 'v', -- charwise
				--		['@function.outer'] = 'V', -- linewise
				--	['@class.outer'] = '<c-v>', -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true of false
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
			},
			-- Below will go to either the start or the end, whichever is closer.
			-- Use if you want more granular movements
			-- Make it even more gradual by adding multiple queries and regex.
			goto_next = {
				["]d"] = "@conditional.outer",
			},
			goto_previous = {
				["[d"] = "@conditional.outer",
			}
		},

	},
}



-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup()


