return {
   ["sbdchd/neoformat"] = {},
   ["tpope/vim-fugitive"] = {},
   ["max397574/better-escape.nvim"] = {
     config = function()
       require("better_escape").setup {
         mapping = {"jk", "jj"}, -- a table with mappings to use
         timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
         clear_empty_lines = false, -- clear line after escaping if there is only whitespace
         keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
       }
     end,
   },
   ["Pocco81/AutoSave.nvim"] = {
      config = function()
        local autosave = require("autosave")

        autosave.setup(
        {
          enabled = true,
          execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
          events = {"InsertLeave", "TextChanged"},
          conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
          },
          write_all_buffers = false,
          on_off_commands = true,
          clean_command_line_interval = 0,
          debounce_delay = 135
        }
        )
      end,
   }
}
