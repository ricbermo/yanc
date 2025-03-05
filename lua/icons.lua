local utils = require "utils"
local signs = utils.signs

vim.fn.sign_define(
  "DiagnosticSignError",
  { text = signs.Error, texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
  { text = signs.Warn, texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { text = signs.Info, texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { text = signs.Hint, texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
