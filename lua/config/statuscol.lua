local statuscol = prequire("statuscol")
if not statuscol then return end

local diagnostic = require('lspsaga.diagnostic')
local handler = diagnostic.show_line_diagnostics

statuscol.setup({
  setopt = true,
  DiagnosticSignError = handler,
  DiagnosticSignHint = handler,
  DiagnosticSignInfo = handler,
  DiagnosticSignWarn = handler
})
