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

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      eslint = {
        keys = {
          { "<leader>ce", "<cmd>EslintFixAll<CR>", desc = "Fix all ESlint errors" },
        },
      },
    },
  },
  -- opts = function()
  --   local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --   keys[#keys + 1] = { "gd", false }
  --   local map = vim.keymap.set
  --   map({ "n" }, "gd", function()
  --     local telescope = require("telescope.builtin")
  --     telescope.lsp_definitions({ on_list = on_list })
  --     notify("Hello, LSP in LSP!", "info")
  --   end, { desc = "display notification" })
  -- end,
}
