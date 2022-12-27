-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "git@github.com:folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

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
  debug = true,
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
