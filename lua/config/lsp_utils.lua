local wk = require "which-key"
local utils = require "utils"
local signs = utils.signs

local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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

  local keymap = {
    buffer = buffer,
    ["<leader>"] = {
      j = {
        name = "+goto",
        D = { vim.lsp.buf.declaration, "declaration" },
        d = { vim.lsp.buf.definition, "definition" },
        r = { vim.lsp.buf.references, "find references" },
        i = { vim.lsp.buf.implementation, "implementation" },
        t = { vim.lsp.buf.type_definition, "type definition" },
      },
      c = {
        name = "+code",
        t = { M.toggle_diagnostics, "toggle diagnostics" },
        h = { M.toggle_hints, "toggle inlay hints" },
        r = { vim.lsp.buf.rename, "rename" },
        a = {
          { vim.lsp.buf.code_action, "code action" },
          { vim.lsp.buf.code_action, "code action", mode = "v" },
        },
        f = {
          {
            M.format,
            "format document",
            cond = cap.documentFormatting,
          },
          {
            M.format,
            "format range",
            cond = cap.documentRangeFormatting,
            mode = "v",
          },
        },
        d = { vim.diagnostic.open_float, "line diagnostics" },
      },
    },
    ["<C-k>"] = { vim.lsp.buf.signature_help, "signature help", mode = { "n", "i" } },
    ["K"] = { vim.lsp.buf.hover, "hover" },
    ["[d"] = { vim.diagnostic.goto_prev, "next diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "prev diagnostic" },
  }

  wk.register(keymap)
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
