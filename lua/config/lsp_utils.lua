local wk = require "which-key"

local M = {}

function M.on_attach(_, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  M.set_keys(bufnr)
end

function M.format()
  require("conform").format { lsp_fallback = true }
end

M.diagnostics_active = true

function M.toggle_diagnostics()
  M.diagnostics_active = not M.diagnostics_active
  if M.diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.toggle_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end

function M.format_sync()
  require("conform").format { async = true, lsp_fallback = true }
end

function M.set_keys(buffer)
  wk.add {
    {
      "<leader>ca",
      vim.lsp.buf.code_action,
      desc = "code action",
      mode = { "n", "v" },
      buffer = buffer,
    },
    { "<leader>cs", vim.lsp.buf.signature_help, desc = "signature help", mode = { "n", "i" }, buffer = buffer },
    { "<leader>cd", vim.diagnostic.open_float, desc = "line diagnostics", buffer = buffer },
    { "<leader>cf", M.format, desc = "format document", buffer = buffer },
    { "<leader>ch", M.toggle_hints, desc = "toggle inlay hints", buffer = buffer },
    { "<leader>cr", vim.lsp.buf.rename, desc = "rename", buffer = buffer },
    { "<leader>ct", M.toggle_diagnostics, desc = "toggle diagnostics", buffer = buffer },
    { "<leader>jD", vim.lsp.buf.declaration, desc = "declaration", buffer = buffer },
    { "<leader>jd", vim.lsp.buf.definition, desc = "definition", buffer = buffer },
    { "<leader>ji", vim.lsp.buf.implementation, desc = "implementation", buffer = buffer },
    { "<leader>jr", vim.lsp.buf.references, desc = "find references", buffer = buffer },
    { "<leader>jn", function() vim.diagnostic.jump { count = 1 } end, desc = "next error", buffer = buffer },
    { "<leader>jp", function() vim.diagnostic.jump { count = -1 } end, desc = "prev error", buffer = buffer },
  }
end

return M
