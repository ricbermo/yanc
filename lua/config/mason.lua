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
  ensure_installed = { "sumneko_lua", "eslint", "tsserver", "jsonls" },
  automatic_installation = true
})

mason_lsp.setup_handlers {
  function (server_name)
    lsp[server_name].setup {
      on_attach = lspUtils.on_attach,
      capabilities = lspUtils.capabilities
    }
  end
}

lspUtils.set_custom_symbol("Error", signs.Error)
lspUtils.set_custom_symbol("Information", signs.Info)
lspUtils.set_custom_symbol("Hint", signs.Hint)
lspUtils.set_custom_symbol("Warning", signs.Warn)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = "",
    spacing = 0,
  },
  signs = true, -- disable icons in signcolum
  underline = true,
  update_in_insert = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single"
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single"
})

vim.lsp.handlers["textDocument/definition"] = lspUtils.goto_definition('split')
