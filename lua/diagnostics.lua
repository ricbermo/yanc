local utils = require "utils"
local signs = utils.signs

vim.diagnostic.config {
  underline = false,
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
}
