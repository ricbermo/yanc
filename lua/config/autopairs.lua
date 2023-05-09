local autopairs = prequire "nvim-autopairs"
if not autopairs then
  return
end

autopairs.setup {}

require("nvim-autopairs.completion.cmp").setup {
  map_cr = false, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = "(",
    tex = "{",
  },
}
