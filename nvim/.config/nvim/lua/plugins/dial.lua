local M = require("dial.map")
return {
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-x>",
      function()
        return M.dial(true)
      end,
      expr = true,
      desc = "Increment",
      mode = { "n", "v" },
    },
    {
      "<C-M-x>",
      function()
        return M.dial(false)
      end,
      expr = true,
      desc = "Decrement",
      mode = { "n", "v" },
    },
  },
}
