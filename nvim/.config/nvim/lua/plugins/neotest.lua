return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/neotest-jest" },
  opts = {
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = {
      ["neotest-jest"] = {
        jestCommand = function(file)
          if string.find(file, ".unit.ts") then
            return "yarn test:unit"
          elseif string.find(file, ".integration.ts") then
            return "yarn test:integration"
          end
          return "jest"
        end,
      },
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    },
  },
}
