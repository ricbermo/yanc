local wk = require "which-key"
local util = require "utils"

local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  M.set_keys(client, bufnr)
end

function M.format()
  vim.lsp.buf.format()
end

function M.set_keys(client, buffer)
  local cap = client.server_capabilities

  local keymap = {
    buffer = buffer,
    ["<leader>"] = {
      c = {
        name = "+code",
        t = { util.toggle_diagnostics, "toggle diagnostics" },
        r = { "<CMD>Lspsaga rename<CR>", "rename" },
        a = {
          { "<CMD>Lspsaga code_action<CR>", "code action" },
          { "<CMD>Lspsaga code_action<CR>", "code action", mode = "v" },
        },
        f = {
          {
            M.format,
            "format document",
            cond = cap.documentFormatting,
          },
          {
            M.format,
            "format range",
            cond = cap.documentRangeFormatting,
            mode = "v",
          },
        },
        d = { "<CMD>Lspsaga show_line_diagnostics<CR>", "line diagnostics" },
        g = {
          name = "+goto",
          d = { "<CMD>Telescope lsp_definitions<CR>", "goto definition" },
          r = { "<CMD>Lspsaga lsp_finder<CR>", "find references" },
          R = { "<CMD>Trouble lsp_references<CR>", "find references (Trouble)" },
          D = { "<CMD>Telescope lsp_declarations<CR>", "goto declaration" },
          I = { "<CMD>Telescope lsp_implementations<CR>", "goto implementation" },
          t = { "<CMD>Telescope lsp_type_definitions<CR>", "goto type definition" },
        },
      },
    },
    ["<C-k>"] = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "signature help", mode = { "n", "i" } },
    ["K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "hover" },
    ["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "next diagnostic" },
    ["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "prev diagnostic" },
  }

  wk.register(keymap)
end

return M
