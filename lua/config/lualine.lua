local lualine = prequire "lualine"
if not lualine then
  return
end

local signs = require("utils").signs

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

local function get_lsp(msg)
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
end

local config = {
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    theme = "catppuccin",
    globalstatus = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "branch",
        icon = signs.Branch,
        cond = conditions.check_git_workspace,
      },
      {
        "diff",
        symbols = {
          added = signs.GitAdded .. " ",
          modified = signs.GitModified .. " ",
          removed = signs.GitRemoved .. " ",
        },
      },
    },
    lualine_c = {
      {
        "lsp_progress",
        display_components = { { "title", "percentage", "message" } },
        separators = {
          component = " ",
          progress = " | ",
          percentage = { pre = "", post = "%% " },
          title = { pre = "", post = ": " },
          message = { commenced = "In Progress", completed = "Completed" },
        },
        timer = { progress_enddelay = 500 },
      },
    },
    lualine_x = {
      {
        get_lsp,
        icon = signs.Config .. " ",
        cond = conditions.buffer_not_empty,
        fmt = string.upper,
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        diagnostics_color = {
          error = "DiagnosticError", -- Changes diagnostics' error color.
          warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
          info = "DiagnosticInfo", -- Changes diagnostics' info color.
          hint = "DiagnosticHint", -- Changes diagnostics' hint color.
        },
        symbols = {
          error = signs.Error .. " ",
          warn = signs.Warn .. " ",
          info = signs.Info .. " ",
          hint = signs.Hint .. " ",
        },
        colored = true,
        update_in_insert = false,
        always_visible = true,
      },
    },
    lualine_y = {
      {
        "filename",
        cond = conditions.buffer_not_empty,
      },
    },
    lualine_z = {
      {
        "filetype",
        icon_only = false,
        fmt = string.upper,
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

lualine.setup(config)
