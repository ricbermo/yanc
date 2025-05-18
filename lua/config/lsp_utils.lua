local wk = require "which-key"
local utils = require "utils"
local signs = utils.signs

local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  M.set_keys(client, bufnr)
end

function M.format()
  vim.lsp.buf.format()
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
  vim.lsp.buf.format { async = true }
end

function M.set_keys(client, buffer)
  wk.add {
    { "<leader>ca", '<cmd>lua require("fastaction").code_action()<CR>', desc = "code action", mode = { "n", "v" } },
    { "<leader>cs", vim.lsp.buf.signature_help, desc = "signature help", buffer = 1, mode = { "n", "i" } },
    { "<leader>cd", vim.diagnostic.open_float, desc = "line diagnostics" },
    { "<leader>cf", M.format, desc = "format document" },
    { "<leader>ch", M.toggle_hints, desc = "toggle inlay hints" },
    { "<leader>cr", vim.lsp.buf.rename, desc = "rename" },
    { "<leader>ct", M.toggle_diagnostics, desc = "toggle diagnostics" },
    { "<leader>jD", vim.lsp.buf.declaration, desc = "declaration" },
    { "<leader>jd", vim.lsp.buf.definition, desc = "definition" },
    { "<leader>ji", vim.lsp.buf.implementation, desc = "implementation" },
    { "<leader>jr", vim.lsp.buf.references, desc = "find references" },
    { "<leader>jn", vim.diagnostic.goto_next, desc = "next error" },
    { "<leader>jp", vim.diagnostic.goto_prev, desc = "prev error" },
  }
end

return M
