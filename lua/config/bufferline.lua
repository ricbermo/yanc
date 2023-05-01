local bufferline = prequire("bufferline")
if not bufferline then return end

bufferline.setup {
  options = {
    numbers = 'ordinal',
    offsets = { { filetype = "alpha", text = "", padding = 1 } },
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = 'nvim_lsp',
    highlights = require("catppuccin.groups.integrations.bufferline").get()
  }
}
