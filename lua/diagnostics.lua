local utils = require "utils"
local signs = utils.signs

vim.diagnostic.config {
  underline = true,
  virtual_text = false,
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
  float = {
    border = "rounded",
    source = true,
    header = "",
    prefix = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = signs.Error,
        [vim.diagnostic.severity.WARN] = signs.Warn,
        [vim.diagnostic.severity.HINT] = signs.Hint,
        [vim.diagnostic.severity.INFO] = signs.Info,
      }
      local hl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticError",
        [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
        [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      }
      return icons[diagnostic.severity] .. " ", hl[diagnostic.severity]
    end,
  },
}
