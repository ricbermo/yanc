-- Replaced telescope.nvim with fzf-lua for faster fuzzy finding
return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>ca", function() require("fzf-lua").lsp_code_actions() end, desc = "code action", mode = { "n", "v" } },
    { "gr", function() require("fzf-lua").lsp_references() end, desc = "find references" },
  },
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.setup(opts)
    fzf.register_ui_select()
  end,
  opts = {
    "default-title",
    fzf_opts = {
      ["--layout"] = "reverse",
    },
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
