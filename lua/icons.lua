local utils = require "utils"
local signs = utils.signs

-- Diagnósticos (LSP)
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end