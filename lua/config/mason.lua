local mason = prequire("mason")
local mason_lsp = prequire("mason-lspconfig")
local lsp = prequire("lspconfig")

if not (mason or mason_lsp) then
  return
end

local signs = require("utils").signs
local lspUtils = require("config.lsp")

mason.setup({
  ui = {
    icons = {
      package_installed = signs.PassCheck,
      package_pending = signs.Running,
      package_uninstalled = signs.GitRemoved
    }
  }
})

mason_lsp.setup({
  ensure_installed = {
    "sumneko_lua",
    "eslint",
    "tsserver",
    "jsonls",
  },
  automatic_installation = true
})

mason_lsp.setup_handlers {
  function(server_name)
    lsp[server_name].setup {
      on_attach = lspUtils.on_attach,
      capabilities = lspUtils.capabilities
    }
  end
}

lspUtils.set_custom_symbol("DiagnosticsSignError", signs.Error)
lspUtils.set_custom_symbol("DiagnosticsSignInfo", signs.Info)
lspUtils.set_custom_symbol("DiagnosticsSignHint", signs.Hint)
lspUtils.set_custom_symbol("DiagnosticsSignWarn", signs.Warn)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  code_action_icon = signs.LightBulb,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded'
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded'
})
