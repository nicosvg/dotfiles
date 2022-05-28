local M = {}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd> Telescope media_files <CR>", "  find media" },
    ["<leader>te"] = { "<cmd> Telescope <CR>", "Telescope" },
    ["<leader>fr"] = { "<cmd> Telescope lsp_references  <CR>", "Find references" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostics  <CR>", "Telescope diagnostics" },
  },
}

M.git = {
  n = {
    ["<leader>tb"] = { "<cmd> Gitsigns toggle_current_line_blame<CR>", "Git: toggle line blame" },
  }
}

M.lspconfig = {
  n = {
      ["<leader>od"] = {
         function()
            vim.diagnostic.open_float()
         end,
         "   open diagnostics",
      },
  }
}

M.neoformat = {
  n = {
    ["<leader>fm"] = { "<cmd> Neoformat<CR>", "Neoformat: format buffer" },
  }
  
}

return M
