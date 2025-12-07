return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 100,
  opts = {
    flavour = "auto",
    background = {
      light = "latte",
      dark = "mocha",
    },
    auto_integrations = true,
  },
  init = function()
    vim.cmd [[colorscheme catppuccin]]
  end,
}
