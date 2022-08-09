local diffview = prequire("diffview")
if not diffview then return end

local signs = require("utils").signs

diffview.setup({
  diff_binaries = false, -- Show diffs for binaries
  enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
  git_cmd = { "git" }, -- The git executable followed by default args.
  use_icons = true, -- Requires nvim-web-devicons
  icons = { -- Only applies when use_icons is true.
    folder_closed = signs.FolderClosed,
    folder_open = signs.FolderOpen,
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    listing_style = "list", -- One of 'list' or 'tree
    win_config = { -- See ':h diffview-config-win_config'
      position = "left",
      width = 40,
    },
  },
  file_history_panel = {
    log_options = { -- See ':h diffview-config-log_options'
      single_file = {
        diff_merges = "combined",
      },
      multi_file = {
        diff_merges = "first-parent",
      },
    },
    win_config = { -- See ':h diffview-config-win_config'
      position = "bottom",
      height = 16,
    },
  },
})
