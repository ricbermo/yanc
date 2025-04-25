local mason_lsp = prequire "mason-lspconfig"
local lsp = prequire "lspconfig"
local utils = require "utils"

if not mason_lsp then
  return
end

local lsp_utils = require "config.lsp_utils"

mason_lsp.setup {
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "jsonls",
    "eslint",
    "tailwindcss",
    "astro",
  },
  automatic_installation = true,
}

mason_lsp.setup_handlers {
  function(server_name)
    lsp[server_name].setup {
      on_attach = lsp_utils.on_attach,
      capabilities = lsp_utils.capabilities,
      handlers = lsp_utils.handlers,
      init_options = lsp_utils.init_options(server_name),
    }
  end,
}

local signs = utils.signs

vim.diagnostic.config {
  underline = false,
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
}
