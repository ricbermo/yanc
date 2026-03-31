return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    show_help = false,
    plugins = { spelling = true },
    replace = { ["<leader>"] = "SPC" },
  },
}
