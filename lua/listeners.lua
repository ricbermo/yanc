local lsp_utils = require "config/lsp_utils"

-- for Catppuccin
-- vim.api.nvim_create_autocmd("OptionSet", {
--   pattern = "background",
--   callback = function()
--     vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
--   end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client then
      lsp_utils.on_attach(client, bufnr)
    end

    if client:supports_method "textDocument/inlayHint" then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})
