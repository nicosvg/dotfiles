-- change some telescope options and a keymap to browse plugin files
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        hidden = true,
        file_ignore_patterns = { ".git" },
      },
      grep_string = {
        additional_args = { "--hidden" },
        file_ignore_patterns = { ".git" },
      },
      live_grep = {
        additional_args = { "--hidden" },
        file_ignore_patterns = { ".git" },
        layout_strategy = "vertical",
      },
      lsp_references = {
        layout_strategy = "vertical",
      },
    },
  },
}
