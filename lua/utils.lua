_G.prequire = function(plugin, verbose)
  local present, plug = pcall(require, plugin)
  if present then
    return plug
  end
  local errmsg = string.format("Could not load %s", plugin)
  if verbose then
    errmsg = string.format("%s\nError:%s", plug)
  end
  print(errmsg)
end

local M = {}

M.signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
  GitAdded = "",
  GitModified = "",
  GitRemoved = "",
  GitRenamed = "",
  Running = "",
  PassCheck = "",
  CheckAlt = " ",
  Forbidden = "",
  FolderClosed = "",
  FolderOpen = "",
  FolderEmpty = "",
  FolderEmptyOpen = "",
  LightBulb = "",
  Config = "",
  Branch = "",
  Code = " ",
  Package = " ",
  Keyboard = " ",
  File = " ",
  Vim = " ",
  QuestionMark = " ",
  Loading = " ",
  Cmd = " ",
  Event = " ",
  Init = " ",
  Expanded = "",
  Collapsed = "",
  Bookmark = "",
  PendingSave = "",
  Left = "",
  Right = "",
}

function M.setSpacesSize(filetypes)
  for filetype, size in pairs(filetypes) do
    vim.cmd(string.format("autocmd FileType %s set sw=%s", filetype, size))
    vim.cmd(string.format("autocmd FileType %s set ts=%s", filetype, size))
    vim.cmd(string.format("autocmd FileType %s set sts=%s", filetype, size))
  end
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

function M.format_sync()
  vim.lsp.buf.format { async = true }
end

function M.try(fn, ...)
  local args = { ... }

  return xpcall(function()
    ---@diagnostic disable-next-line: deprecated
    return fn(unpack(args))
  end, function(err)
    local lines = {}
    table.insert(lines, err)
    table.insert(lines, debug.traceback("", 3))

    M.error(table.concat(lines, "\n"))
    return err
  end)
end

function M.require(mod)
  local ok, ret = M.try(require, mod)
  return ok and ret
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name or "init.lua" })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name or "init.lua" })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name or "init.lua" })
end

function M.lazygit_toggle()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "double",
    },
  }

  lazygit:toggle()
end

return M
