local wk = require "which-key"
local utils = require "utils"
local signs = utils.signs

local M = {}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
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
  local cap = client.server_capabilities

  wk.add {
    { "<leader>ca", vim.lsp.buf.code_action, desc = "code action", mode = { "n", "v" } },
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
    { "<leader>jT", vim.lsp.buf.type_definition, desc = "type definition" },
  }
end

M.handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    code_action_icon = signs.LightBulb,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }),

  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  }),

  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  }),
}

function M.init_options(server_name)
  if server_name == "tsserver" then
    return {
      preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        importModuleSpecifierPreference = "non-relative",
      },
    }
  end
end

return M
