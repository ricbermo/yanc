local utils = require("utils")

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = function() utils.config_winbar_or_statusline() end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspsagaUpdateSymbol',
  callback = function() utils.config_winbar_or_statusline() end,
})
