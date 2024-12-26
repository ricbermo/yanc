local null_ls = require "null-ls"
if not null_ls then
  return
end

null_ls.setup {
  debug = false,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
  },
  on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client)
  end,
}
