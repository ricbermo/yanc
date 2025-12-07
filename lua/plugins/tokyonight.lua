return {
  "folke/tokyonight.nvim",
  enabled = false,
  lazy = false,
  priority = 1,
  opts = {
    style = "moon",
  },
  init = function()
    vim.o.background = "dark"
    vim.cmd [[colorscheme tokyonight]]
  end,
}
