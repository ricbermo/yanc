local mason_lsp = prequire "mason-lspconfig"
local lsp = prequire "lspconfig"

if not mason_lsp then
  return
end

local lspUtils = require "config.lsp_utils"

mason_lsp.setup {
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "jsonls",
  },
  automatic_installation = true,
}

mason_lsp.setup_handlers {
  function(server_name)
    lsp[server_name].setup {
      on_attach = lspUtils.on_attach,
      capabilities = lspUtils.capabilities,
      handlers = lspUtils.handlers,
    }
  end,
}
