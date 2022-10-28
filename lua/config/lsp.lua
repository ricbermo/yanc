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
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  local opts = { noremap = true, silent = true }

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  buf_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  buf_set_keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- scroll down hover doc or scroll in definition preview
  buf_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
  buf_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

  buf_set_keymap("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  buf_set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  buf_set_keymap("n", "<leader>cc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

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
  vim.fn.sign_define("DiagnosticsSign" .. name, {
    text = icon,
    numhl = "DiagnosticsDefault" .. name,
    texthl = "DiagnosticsSign" .. name,
  })
end

function M.goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

return M
