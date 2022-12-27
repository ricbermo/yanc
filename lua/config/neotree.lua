local neotree = prequire('neo-tree')
if not neotree then
  return
end

local utils = require("utils")
local signs = utils.signs

utils.set_custom_symbol("DiagnosticsSignError", signs.Error)
utils.set_custom_symbol("DiagnosticsSignInfo", signs.Info)
utils.set_custom_symbol("DiagnosticsSignHint", signs.Hint)
utils.set_custom_symbol("DiagnosticsSignWarn", signs.Warn)

neotree.setup({
  popup_border_style = "rounded",
  enable_git_status = true,
  default_component_configs = {
    icon = {
      folder_closed = signs.FolderClosed,
      folder_open = signs.FolderOpen,
      folder_empty = signs.FolderEmpty,
    },
    git_status = {
      symbols = {
        -- Change type
        added     = signs.GitAdded,
        deleted   = signs.GitRemoved,
        modified  = signs.GitModified,
        renamed   = "",
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    position = "left",
    width = 40,
    number = true,
    relativenumber = true,
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
        vim.cmd [[
          setlocal relativenumber
        ]]
      end,
    }
  },
})
