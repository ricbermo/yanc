-- bootstrap from github
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "git@github.com:folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

-- source lua files
local util = require "utils"
local require = util.require

require "options" -- vim options
require "config.plugin_manager" -- Lazy plugin manager

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "commands"
    require "mappings"
    require "icons"
  end,
})
