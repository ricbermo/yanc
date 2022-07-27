local lspconfig = prequire("lspconfig")
local lsp_installer = prequire("nvim-lsp-installer")

if not (lspconfig or lsp_installer) then
  return
end

local cmd = vim.api.nvim_command

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local function on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  buf_set_keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- scroll down hover doc or scroll in definition preview
  buf_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
  buf_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

  buf_set_keymap("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
  buf_set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  buf_set_keymap("n", "<leader>cc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)')
  elseif client.resolved_capabilities.document_range_formatting then
    cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.range_formatting()')
  end
end

local function set_custom_symbol(name, icon)
  vim.fn.sign_define("LspDiagnosticsSign" .. name, {
    text = icon,
    numhl = "LspDiagnosticsDefault" .. name,
    texthl = "LspDiagnosticsSign" .. name,
  })
end

local function goto_definition(split_cmd)
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

local signs = require("utils").signs

set_custom_symbol("Error", signs.Error)
set_custom_symbol("Information", signs.Info)
set_custom_symbol("Hint", signs.Hint)
set_custom_symbol("Warning", signs.Warn)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = "",
    spacing = 0,
  },
  signs = true, -- disable icons in signcolum
  underline = true,
  update_in_insert = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single"
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single"
})

vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

require('nvim-lsp-installer').on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = vim.loop.cwd,
    flags = {
      debounce_text_changes = 200,
    }
  }

  if server.name == "eslint" then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = true
      on_attach(client, bufnr)
    end

    opts.settings = {
      format = { enable = true },
    }
  end

  if server.name == "tsserver" then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      on_attach(client, bufnr)
    end

    opts.settings = {
      format = { enable = false },
    }
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
