local blankline = prequire "ibl"
if not blankline then
  return
end

blankline.setup {
  indentLine_enabled = 1,
  show_current_context = true,
  char = "▏",
  space_char_blankline = " ",
  buftype_exclude = { "terminal" },
  filetype_exclude = { "help", "terminal", "dashboard", "alpha" },
}
