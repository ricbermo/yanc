return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
  },
  init = function()
    vim.o.background = "dark"
    vim.cmd [[colorscheme tokyonight]]
  end,
}
