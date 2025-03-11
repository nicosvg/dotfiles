return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})
  end,
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
}
