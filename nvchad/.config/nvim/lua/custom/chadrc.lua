local M = {}

local userPlugins = require "custom.plugins"

M.ui = {
   theme = "kanagawa",
}

M.plugins = {
   options = {
      lspconfig = {
        setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   user = userPlugins,
}

M.mappings = require "custom.mappings"

return M
