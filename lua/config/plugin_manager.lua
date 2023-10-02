local signs = require("utils").signs

-- load lazy
require("lazy").setup("plugins", {
  install = { colorscheme = { "catppuccin" } },
  defaults = { lazy = true },
  checker = { enabled = true },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
    icons = {
      loaded = signs.PassCheck,
      not_loaded = signs.QuestionMark,
      cmd = signs.Cmd,
      config = signs.Config,
      event = signs.Event,
      ft = signs.File,
      init = signs.Config,
      keys = signs.Keyboard,
      plugin = signs.Package,
      runtime = signs.Vim,
      source = signs.Code,
      start = signs.Init,
      task = signs.CheckAlt,
      lazy = signs.Loading,
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
