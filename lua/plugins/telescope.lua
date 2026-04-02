-- Replaced telescope.nvim with fzf-lua for faster fuzzy finding
return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    "default-title",
    winopts = {
      height = 0.80,
      width = 0.87,
      preview = {
        horizontal = "right:55%",
      },
    },
    keymap = {
      fzf = {
        ["tab"] = "down",
        ["shift-tab"] = "up",
      },
    },
  },
}
