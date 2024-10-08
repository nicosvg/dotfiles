require("config.lazy")

vim.g.mapleader = ' '
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })


-- Nvim Tree

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--
-- set color scheme
-- vim.cmd('colorscheme tokyonight')
vim.cmd.colorscheme "catppuccin"

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
	git = { ignore = false },
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
})

-- Keys
local key_mapper = function(mode, key, result)
	vim.keymap.set(mode, key, result, {
		noremap = true,
		silent = true,
	})
end
-- NvimTree
key_mapper('n', '<c-n>', '<cmd> NvimTreeToggle <CR>')
key_mapper('n', '<leader>e', '<cmd> NvimTreeFocus <CR>')
-- Reload config
key_mapper('n', '<leader>rc', '<cmd> source $MYVIMRC <CR>')
-- Telescope
local builtin = require('telescope.builtin')
local egrepify = require 'telescope'.extensions.egrepify
key_mapper('n', '<leader>ff', builtin.find_files)
key_mapper('n', '<M-p>', builtin.find_files)
key_mapper('n', '<leader>fa', egrepify.egrepify)
key_mapper('n', '<leader>b', builtin.buffers)
--  { sort_mru=true, ignore_current_buffer=true }
key_mapper('n', '<leader>fh', builtin.help_tags)
key_mapper('n', '<leader>gr', builtin.lsp_references)
key_mapper('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols)
key_mapper('n', '<leader>fr', builtin.registers)
key_mapper('n', 'gr', builtin.lsp_references)
-- Buffers
key_mapper('n', '<leader>l', "<CMD>bnext<CR>")
key_mapper('n', '<leader>L', "<CMD>bprev<CR>")
key_mapper('n', '<leader>i', vim.lsp.buf.format)
key_mapper('n', '<leader>w', "<CMD>w<CR>")

--Telescope
local actions = require('telescope.actions')
require('telescope').setup {
	pickers = {
		colorscheme = {
			enable_preview = true
		},
		find_files = {
			hidden = true
		}
	},
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-e>"] = { "<esc>", type = "command" },
			}
		}
	},
	mappings = {
		i = {
			["<C-Down>"] = "cycle_history_next",
			["<C-Up>"] = "cycle_history_prev",
			["<C-h>"] = "which_key",
		}
	}
}

-- LSP keymaps
local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	return string.match(value.filename, "index.d.ts") == nil and string.match(value.filename, "types.d.ts") == nil
end

local function on_list(options)
	local items = options.items
	if #items > 1 then
		items = filter(items, filterReactDTS)
	end

	vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
	vim.api.nvim_command("cfirst") -- or maybe you want 'copen' instead of 'cfirst'
end

-- On LSP
vim.keymap.set("n", "gd", function()
	builtin.lsp_definitions({ on_list = on_list })
end)
-- key_mapper('n', 'gD', '<CMD>lua vim.lsp.buf.definition()<CR>')
key_mapper('n', '<leader>ca', vim.lsp.buf.code_action)

-- Leap
require('leap').add_default_mappings()

-- LSP zero
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- here you can setup the language servers

-- LSP
--require'lspconfig'.tsserver.setup {
--	on_attach = on_attach,
--	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--	cmd = { "typescript-language-server", "--stdio" }
--}

require('nvim-ts-autotag').setup()

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { 'ts_ls', 'rust_analyzer', 'lua_ls' },
	handlers = {
		lsp_zero.default_setup,
	},
	lazy = false,
	opts = {
		auto_install = true
	}
})

require 'lspconfig'.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

-- Autocomplete
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	})
})

-- Smooth scroll setup
require('neoscroll').setup()
vim.o.scrolloff = 8

-- Status line
require('lualine').setup {
	options = {
		theme = "catppuccin",
		component_separators = '',
		section_separators = { left = '', right = '' },
	}
}

-- mini.nvim
local starter = require('mini.starter')
starter.setup({
	-- evaluate_single = true,
	items = {
		starter.sections.sessions(77, true),
		starter.sections.builtin_actions(),
	},
	content_hooks = {
		function(content)
			local blank_content_line = { { type = 'empty', string = '' } }
			local section_coords = starter.content_coords(content, 'section')
			-- Insert backwards to not affect coordinates
			for i = #section_coords, 1, -1 do
				table.insert(content, section_coords[i].line + 1, blank_content_line)
			end
			return content
		end,
		starter.gen_hook.adding_bullet("» "),
		starter.gen_hook.aligning('center', 'center'),
	},
	header = 'Hello Nico!',
	footer = '',
})

require('mini.sessions').setup({
	-- Whether to read latest session if Neovim opened without file arguments
	autoread = false,
	-- Whether to write current session before quitting Neovim
	autowrite = true,
	-- Directory where global sessions are stored (use `''` to disable)
	directory = '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
	-- File for local session (use `''` to disable)
	file = ''               -- 'Session.vim',
})

-- Format on save
-- disabled as it slows saving
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		-- vim.lsp.buf.format { async = false }
-- 	end
-- })

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Copilot
vim.g.copilot_node_command = "/Users/nico/.local/state/fnm_multishells/88954_1727452566831/bin/node"
