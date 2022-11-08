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


M.powerline = {
  circle = {
    left = "",
    right = "",
  },
  arrow = {
    left = "",
    right = "",
  },
  triangle = {
    left = " ",
    right = "",
  },
  none = {
    left = "",
    right = "",
  },
}

M.signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
  GitAdded = "",
  GitModified = "",
  GitRemoved = "",
  Running = "",
  PassCheck = "",
  Forbidden = "",
  FolderClosed = "",
  FolderOpen = "",
  FolderEmpty = "",
  LightBulb = "",
  Config = "",
}

M.colors = {
  bg = "#2e3440",
  fg = "#ECEFF4",
  red = "#bf616a",
  orange = "#d08770",
  yellow = "#ebcb8b",
  blue = "#5e81ac",
  green = "#a3be8c",
  cyan = "#88c0d0",
  magenta = "#b48ead",
  pink = "#FFA19F",
  grey1 = "#f8fafc",
  grey2 = "#f0f1f4",
  grey3 = "#eaecf0",
  grey4 = "#d9dce3",
  grey5 = "#c4c9d4",
  grey6 = "#b5bcc9",
  grey7 = "#929cb0",
  grey8 = "#8e99ae",
  grey9 = "#74819a",
  grey10 = "#616d85",
  grey11 = "#464f62",
  grey12 = "#3a4150",
  grey13 = "#333a47",
  grey14 = "#242932",
  grey15 = "#1e222a",
  grey16 = "#1c1f26",
  grey17 = "#0f1115",
  grey18 = "#0d0e11",
  grey19 = "#020203",
}

function M.setSpacesSize(filetypes)
  for filetype, size in pairs(filetypes) do
    vim.cmd(string.format("autocmd FileType %s set sw=%s", filetype, size))
    vim.cmd(string.format("autocmd FileType %s set ts=%s", filetype, size))
    vim.cmd(string.format("autocmd FileType %s set sts=%s", filetype, size))
  end
end

function M.impatient()
  local impatient_ok, _ = pcall(require, "impatient")
  if impatient_ok then
    require("impatient").enable_profile()
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

function M.register_groups(maps)
  local nest = prequire("nest")
  local wk = prequire("which-key")
  if not nest and wk then return end

  for _, map in pairs(maps) do
    if map.name or map.prefix then
      wk.register({ [map.prefix] = { name = map.name } })
    end

    nest.applyKeymaps(map)
  end
end

function M.format_sync()
  vim.lsp.buf.format { async = true }
end

function M.get_file_name(include_path)
  local file_name = require('lspsaga.symbolwinbar').get_file_name()
  if vim.fn.bufname '%' == '' then return '' end
  if include_path == false then return file_name end
  -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
  local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
  local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)
  local file_path = ''
  for _, cur in ipairs(path_list) do
    file_path = (cur == '.' or cur == '~') and '' or
        file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
  end
  return file_path .. file_name
end

function M.config_winbar_or_statusline()
  local exclude = {
    ['terminal'] = true,
    ['toggleterm'] = true,
    ['prompt'] = true,
    ['NvimTree'] = true,
    ['help'] = true,
    ['alpha'] = true,
  } -- Ignore float windows and exclude filetype
  if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
    vim.wo.winbar = ''
  else
    local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
    local sym
    if ok then sym = lspsaga.get_symbol_node() end
    local win_val = ''
    win_val = M.get_file_name(true) -- set to true to include path
    if sym ~= nil then win_val = win_val .. sym end
    vim.wo.winbar = win_val
    -- if work in statusline
    vim.wo.stl = win_val
  end
end

return M;
