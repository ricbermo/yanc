return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = { enabled = true } },
    replace = {
      key = {
        { "<Space>", "SPC" },
        { "<leader>", "SPC" },
      },
    },
    show_help = false,
  },
}
