local blankline = prequire("indent_blankline")
if not blankline then
    return
end

blankline.setup {
  indentLine_enabled = 1,
  char = "▏",
  space_char_blankline = " ",
  buftype_exclude = {"terminal"},
  filetype_exclude = { "help", "terminal", "dashboard", "packer" },
  show_current_context = true
}
