local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(c)
      return c.name ~= "tsserver"
    end,
    bufnr = bufnr,
  })
end

local cmd = vim.api.nvim_command

function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  local map = function(m, lhs, rhs)
    local opts = { remap = false, silent = true, buffer = bufnr }
    vim.keymap.set(m, lhs, rhs, opts)
  end

  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  map('n', 'gr', '<cmd>Lspsaga lsp_finder<cr>')
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  map('n', '<F2>', '<cmd>Lspsaga rename<cr>')
  map('n', 'ca', '<cmd>Lspsaga code_action<cr>')
  map('x', 'ca', '<cmd>Lspsaga code_action<cr>')

  -- Diagnostics
  map('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>')
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end

  if (client.name == "eslint") then
    cmd('autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll')
  end
end

function M.set_custom_symbol(name, icon)
  vim.fn.sign_define(name, {
    text = icon,
    texthl = name,
    numhl = '',
  })
end

return M
