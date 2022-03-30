local neotree = prequire('neo-tree')
if not neotree then
  return
end

vim.fn.sign_define("DiagnosticSignError", {text = "? ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "? ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "? ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "?", texthl = "DiagnosticSignHint"})

neotree.setup({
  popup_border_style = "rounded",
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        deleted   = "✖",
        modified  = "",
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
})
