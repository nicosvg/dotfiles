return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          always_show_by_pattern = {
            ".env*",
          },
        },
      },
    },
  },
}
