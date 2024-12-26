local utils = require "utils"
local signs = utils.signs

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeFindFileToggle" },
  opts = {
    diagnostics = {
      enable = true,
      icons = {
        hint = signs.LightBulb,
        info = signs.Info,
        warning = signs.Warn,
        error = signs.Error,
      },
    },
    update_focused_file = {
      enable = false,
    },
    filters = {
      dotfiles = false,
    },
    view = {
      number = true,
      relativenumber = true,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          default = signs.File,
          symlink = "",
          bookmark = signs.Bookmark,
          modified = "●",
          folder = {
            arrow_closed = signs.Expanded,
            arrow_open = signs.Collapsed,
            default = signs.FolderClosed,
            open = signs.FolderOpen,
            empty = signs.FolderEmpty,
            empty_open = signs.FolderEmptyOpen,
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = signs.GitModified,
            staged = signs.GitAdded,
            unmerged = signs.Branch,
            renamed = signs.GitRenamed,
            deleted = signs.GitRemoved,
            untracked = signs.Info,
            ignored = "",
          },
        },
      },
    },
  },
}
