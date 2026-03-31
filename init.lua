-- bootstrap from github
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    lazyrepo,
    lazypath,
  }

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({ { "Failed to clone lazy.nvim from " .. lazyrepo, "ErrorMsg" } }, true, {})
  end
end

if vim.loop.fs_stat(lazypath) then
  vim.opt.runtimepath:prepend(lazypath)
end

-- source lua files
local util = require "utils"
local require = util.require

require "options" -- vim options
require "config.plugin_manager" -- Lazy plugin manager

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "listeners"
    require "mappings"
    require "diagnostics"
    require "capabilities"
  end,
})
