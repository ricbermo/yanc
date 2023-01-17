local mason_lsp = prequire("mason-lspconfig")
local lsp = prequire("lspconfig")

if not mason_lsp then
  return
end

local utils = require("utils")
local signs = utils.signs
local lspUtils = require("config.lsp_utils")

mason_lsp.setup({
  ensure_installed = {
    "sumneko_lua",
    "eslint",
    "tsserver",
    "jsonls",
    "emmet_ls"
  },
  automatic_installation = true
})

mason_lsp.setup_handlers {
  function(server_name)
    lsp[server_name].setup {
      on_attach = lspUtils.on_attach,
      capabilities = lspUtils.capabilities
    }
  end,
  ['emmet_ls'] = function ()
    lsp.emmet_ls.setup({
    capabilities = lspUtils.capabilities,
      filetypes = {
        'html',
        'css',
        'typescriptreact',
        'javascriptreact',
        'javascript',
      },
    })
  end
}

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

vim.fn.sign_define("DiagnosticSignError", { text = signs.Error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = signs.Warn, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = signs.Info, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = signs.Hint, texthl = "DiagnosticSignHint" })
