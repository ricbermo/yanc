local wk = require("which-key")
local util = require("utils")

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

  M.set_keys(client, bufnr)

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
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end
end

M.autoformat = true

function M.format()
  if M.autoformat then
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    else
      vim.lsp.buf.formatting_sync()
    end
  end
end

function M.set_keys(client, buffer)
  local cap = client.server_capabilities

  local keymap = {
    buffer = buffer,
    ["<leader>"] = {
      c = {
        name = "+code",
        t = { util.toggle_diagnostics, "Toggle Diagnostics" },
        r = { "<CMD>Lspsaga rename<CR>", "Rename" },
        a = {
          { "<CMD>Lspsaga code_action<CR>", "Code Action" },
          { "<CMD>Lspsaga code_action<CR>", "Code Action", mode = "v" },
        },
        f = {
          {
            M.format,
            "Format Document",
            cond = cap.documentFormatting,
          },
          {
            M.format,
            "Format Range",
            cond = cap.documentRangeFormatting,
            mode = "v",
          },
        },
        d = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
        g = {
          name = "+goto",
          d = { "<CMD>Telescope lsp_definitions<CR>", "Goto Definition" },
          r = { "<CMD>Lspsaga lsp_finder<CR>", "References" },
          R = { "<CMD>Trouble lsp_references<CR>", "Trouble References" },
          D = { "<CMD>Telescope lsp_declarations<CR>", "Goto Declaration" },
          I = { "<CMD>Telescope lsp_implementations<CR>", "Goto Implementation" },
          t = { "<CMD>Telescope lsp_type_definitions<CR>", "Goto Type Definition" },
        },
      },
    },
    ["<C-k>"] = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
    ["K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
    ["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
  }

  wk.register(keymap)
end

return M
