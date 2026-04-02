local lsp_utils = require "config/lsp_utils"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if not client then
      return
    end

    lsp_utils.on_attach(client, bufnr)

    if client:supports_method "textDocument/inlayHint" then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})
