local signs = require("utils").signs

local sep = { left = "", right = "" }
local thin = { left = "", right = "" }

local function setup_highlights()
  local function hl(name)
    local ok, h = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
    if ok then
      return h
    end
    return {}
  end

  local normal = hl "Normal"
  local statusline = hl "StatusLine"
  local accent = hl "Function"
  local git_hl = hl "String"
  local diag_info = hl "DiagnosticInfo"

  local bg = statusline.bg or normal.bg or 0x1e1e2e
  local fg = statusline.fg or normal.fg or 0xcdd6f4
  local accent_fg = accent.fg or 0x89b4fa
  local git_fg = git_hl.fg or 0xa6e3a1
  local info_fg = diag_info.fg or 0x89dceb

  vim.api.nvim_set_hl(0, "StMode", { fg = bg, bg = accent_fg, bold = true })
  vim.api.nvim_set_hl(0, "StModeSep", { fg = accent_fg, bg = bg })
  vim.api.nvim_set_hl(0, "StGit", { fg = git_fg, bg = bg, bold = true })
  vim.api.nvim_set_hl(0, "StGitDiff", { fg = git_fg, bg = bg })
  vim.api.nvim_set_hl(0, "StLsp", { fg = info_fg, bg = bg })
  vim.api.nvim_set_hl(0, "StFile", { fg = fg, bg = bg, bold = true })
  vim.api.nvim_set_hl(0, "StFiletype", { fg = bg, bg = accent_fg, bold = true })
  vim.api.nvim_set_hl(0, "StFiletypeSep", { fg = accent_fg, bg = bg })
  vim.api.nvim_set_hl(0, "StSep", { fg = fg, bg = bg })
end

setup_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = setup_highlights,
})

local mode_map = {
  ["n"] = "NORMAL",
  ["no"] = "O-PENDING",
  ["nov"] = "O-PENDING",
  ["noV"] = "O-PENDING",
  ["no\22"] = "O-PENDING",
  ["niI"] = "NORMAL",
  ["niR"] = "NORMAL",
  ["niV"] = "NORMAL",
  ["nt"] = "NORMAL",
  ["v"] = "VISUAL",
  ["vs"] = "VISUAL",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  ["\19"] = "S-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["ix"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE",
  ["Rx"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE",
  ["Rvx"] = "V-REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "REPLACE",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current = vim.api.nvim_get_mode().mode
  local label = mode_map[current] or current
  return "%#StMode# " .. label .. " %#StModeSep#" .. sep.right .. "%*"
end

local function git_branch()
  local head = vim.b.gitsigns_head
  if not head or head == "" then
    return ""
  end
  return "%#StGit# " .. signs.Branch .. " " .. head .. " %*"
end

local function git_diff()
  local status = vim.b.gitsigns_status_dict
  if not status then
    return ""
  end
  local parts = {}
  if (status.added or 0) > 0 then
    table.insert(parts, signs.GitAdded .. " " .. status.added)
  end
  if (status.changed or 0) > 0 then
    table.insert(parts, signs.GitModified .. " " .. status.changed)
  end
  if (status.removed or 0) > 0 then
    table.insert(parts, signs.GitRemoved .. " " .. status.removed)
  end
  if #parts == 0 then
    return ""
  end
  return "%#StGitDiff#" .. table.concat(parts, " ") .. " %*"
end

local function lsp_clients()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  if #clients == 0 then
    return ""
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return "%#StLsp# " .. signs.Config .. " " .. string.upper(table.concat(names, ", ")) .. " %*"
end

local function diagnostics()
  local counts = vim.diagnostic.count(0)
  local parts = {}
  local map = {
    { severity = vim.diagnostic.severity.ERROR, sign = signs.Error, hl = "DiagnosticError" },
    { severity = vim.diagnostic.severity.WARN, sign = signs.Warn, hl = "DiagnosticWarn" },
  }
  for _, item in ipairs(map) do
    local count = counts[item.severity] or 0
    if count > 0 then
      table.insert(parts, "%#" .. item.hl .. "#" .. item.sign .. " " .. count)
    end
  end
  if #parts == 0 then
    return ""
  end
  return table.concat(parts, " ") .. "%* "
end

local function lsp_progress()
  if vim.ui and vim.ui.progress_status then
    local status = vim.ui.progress_status()
    if status and status ~= "" then
      return "%#StLsp# " .. status .. " %*"
    end
  end
  return ""
end

local function filename()
  return "%#StFile# %t %m%*"
end

local function filetype()
  local ft = vim.bo.filetype
  if ft == "" then
    return ""
  end
  return "%#StFiletypeSep#" .. sep.left .. "%#StFiletype# " .. string.upper(ft) .. " %*"
end

function _G.statusline()
  local parts = {
    mode(),
    " ",
    git_branch(),
    git_diff(),
    "%#StSep#" .. thin.left .. "%*",
    lsp_progress(),
    "%=",
    filename(),
    "%=",
    diagnostics(),
    "%#StSep#" .. thin.right .. "%* ",
    lsp_clients(),
    filetype(),
  }
  return table.concat(parts)
end

vim.o.statusline = "%!v:lua.statusline()"
