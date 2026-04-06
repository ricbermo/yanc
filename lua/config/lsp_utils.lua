local wk = require "which-key"

local M = {}

function M.rename()
  local current = vim.fn.expand "<cword>"
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.max(#current + 10, 25)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "cursor",
    row = 1,
    col = 0,
    width = width,
    height = 1,
    style = "minimal",
    border = "rounded",
    title = " Rename ",
    title_pos = "center",
  })

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { current })
  vim.cmd "startinsert!"

  local function close()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
    if vim.api.nvim_buf_is_valid(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  vim.keymap.set({ "i", "n" }, "<CR>", function()
    local new = vim.trim(vim.api.nvim_buf_get_lines(buf, 0, -1, false)[1] or "")
    close()
    if new ~= "" and new ~= current then
      vim.lsp.buf.rename(new)
    end
  end, { buffer = buf })

  vim.keymap.set({ "i", "n" }, "<Esc>", close, { buffer = buf })
end

function M.on_attach(_, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  M.set_keys(bufnr)
end

function M.format()
  require("conform").format { lsp_fallback = true }
end

M.diagnostics_active = true

function M.toggle_diagnostics()
  M.diagnostics_active = not M.diagnostics_active
  if M.diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.toggle_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end

function M.format_sync()
  require("conform").format { async = true, lsp_fallback = true }
end

function M.set_keys(buffer)
  wk.add {
    {
      "<leader>ca",
      function() require("fzf-lua").lsp_code_actions() end,
      desc = "code action",
      mode = { "n", "v" },
      buffer = buffer,
    },
    { "K", function() vim.lsp.buf.hover { border = "rounded" } end, desc = "hover", buffer = buffer },
    { "<leader>cs", function() vim.lsp.buf.signature_help { border = "rounded" } end, desc = "signature help", mode = { "n", "i" }, buffer = buffer },
    { "<leader>cd", vim.diagnostic.open_float, desc = "line diagnostics", buffer = buffer },
    { "<leader>cf", M.format, desc = "format document", buffer = buffer },
    { "<leader>ch", M.toggle_hints, desc = "toggle inlay hints", buffer = buffer },
    { "<leader>cr", M.rename, desc = "rename", buffer = buffer },
    { "<leader>ct", M.toggle_diagnostics, desc = "toggle diagnostics", buffer = buffer },
    { "<leader>ci", "<CMD>Mason<CR>", desc = "manage servers", buffer = buffer },
    { "<leader>cl", "<CMD>MasonLog<CR>", desc = "server logs", buffer = buffer },
    { "gd", vim.lsp.buf.definition, desc = "goto definition", buffer = buffer },
    { "gD", vim.lsp.buf.declaration, desc = "goto declaration", buffer = buffer },
    { "gi", vim.lsp.buf.implementation, desc = "goto implementation", buffer = buffer },
    { "gr", function() require("fzf-lua").lsp_references() end, desc = "find references", buffer = buffer },
  }
end

return M
