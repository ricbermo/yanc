local mason_lsp = prequire "mason-lspconfig"
local lsp = prequire "lspconfig"

if not mason_lsp then
  return
end

local utils = require "config.lsp_utils"

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
      on_attach = utils.on_attach,
      capabilities = utils.capabilities,
      handlers = utils.handlers,
      init_options = utils.init_options(server_name),
    }
  end,
}
