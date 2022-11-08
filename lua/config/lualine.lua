local lualine = prequire("lualine")
if not lualine then return end

local colors = require("utils").colors
local signs = require("utils").signs
local powerline = require("utils").powerline.triangle

local mode_color = {
  n = colors.cyan,
  i = colors.green,
  v = colors.magenta,
  c = colors.red,
  no = colors.magenta,
  s = colors.orange,
  [""] = colors.orange,
  ic = colors.yellow,
  R = colors.magenta,
  Rv = colors.magenta,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.red,
  t = colors.red,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    globalstatus = true,
    component_separators = "",
    section_separators = "",
    theme = 'catppuccin'
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local function ins_left_inactive(component)
  table.insert(config.inactive_sections.lualine_c, component)
end

ins_left {
  function()
    vim.api.nvim_command("hi LualineViModeStart guibg=" .. mode_color[vim.fn.mode()])
    return " "
  end,
  color = "LualineViModeStart",
  padding = { right = 0 },
}

ins_left {
  function()
    vim.api.nvim_command(
      "hi LualineViMode guifg="
      .. mode_color[vim.fn.mode()]
      .. " guibg="
      .. colors.grey14
      .. " gui=bold cterm=bold"
    )
    return require("lualine.utils.mode").get_mode()
  end,
  icons_enabled = true,
  color = "LualineViMode",
  padding = { right = 1, left = 1 },
}

ins_left {
  function()
    return powerline.right
  end,
  color = { fg = colors.grey14, bg = colors.grey13 },
  padding = 0,
}

ins_left {
  "filetype",
  fmt = string.upper,
  icons_enabled = true,
  color = { fg = colors.grey9, bg = colors.grey13 },
}

ins_left {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9, gui = "italic" },
}

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = signs.Error .. " ",
    warn = signs.Warn .. " ",
    info = signs.Info .. " ",
    hint = signs.Hint .. " "
  },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

ins_left {
  function()
    return "%="
  end,
}

ins_right {
  function(msg)
    msg = msg or "Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return "Inactive"
      end
      return msg
    end
    local buf_client_names = {}

    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    return table.concat(buf_client_names, ", ")
  end,
  icon = signs.Config .. " ",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9 },
}

ins_right { "location", icon = "", color = { fg = colors.grey9 } }

ins_right {
  "branch",
  icon = signs.Branch,
  cond = conditions.check_git_workspace,
  color = { fg = colors.magenta, bg = colors.grey14, gui = "bold" },
}

ins_right {
  "diff",
  symbols = {
    added = signs.GitAdded .. " ",
    modified = signs.GitModified .. " ",
    removed = signs.GitRemoved .. " "
  },
  diff_color = {
    added = { fg = colors.green, bg = colors.grey14 },
    modified = { fg = colors.orange, bg = colors.grey14 },
    removed = { fg = colors.red, bg = colors.grey14 },
  },
}

ins_right {
  function()
    vim.api.nvim_command("hi LualineViModeEnd guibg=" .. mode_color[vim.fn.mode()])
    return " "
  end,
  color = "LualineViModeEnd",
  padding = { right = 0 },
}

-- Inactive
ins_left_inactive {
  function()
    return " "
  end,
  color = { bg = colors.grey9 },
  padding = { right = 0 },
}

ins_left_inactive {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9, bg = colors.grey14, gui = "bold" },
}

ins_left_inactive {
  function()
    return powerline.right
  end,
  color = { fg = colors.grey14, bg = colors.bg },
  padding = 0,
}

lualine.setup(config)
