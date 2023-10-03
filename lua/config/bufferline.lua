local bufferline = prequire "bufferline"
if not bufferline then
  return
end

local signs = require("utils").signs

bufferline.setup {
  options = {
    buffer_close_icon = signs.Error,
    modified_icon = signs.PendingSave,
    close_icon = signs.Error,
    left_trunc_marker = signs.Left,
    right_trunc_marker = signs.Right,
    numbers = "ordinal",
    offsets = { { filetype = "alpha", text = "", padding = 1 } },
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = "nvim_lsp",
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
  },
}
