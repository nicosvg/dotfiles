-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- save file
map({ "i", "x", "n", "s" }, "<M-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- LSP go to definition skips description files
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

local function filterDTSFiles(value)
  return string.match(value.filename, "index.d.ts") == nil and string.match(value.filename, "types.d.ts") == nil
end

local function on_list(options)
  notify("Skipping definition files", "info")
  local items = options.items
  if #items > 1 then
    items = filter(items, filterDTSFiles)
  end

  vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
  vim.api.nvim_command("copen")
end

-- On LSP
-- map({ "n" }, "gd", function()
--   local telescope = require("telescope.builtin")
--   telescope.lsp_definitions({ on_list = on_list })
-- end, { desc = "Go to definition", remap = true })
