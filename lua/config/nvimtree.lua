local g = vim.g
local nvimtree = prequire("nvim-tree")
if not nvimtree then return end


nvimtree.setup{
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable = true
  },
  filters = {
    dotfiles = false,
  },
}

require'nvim-tree.view'.View.winopts.relativenumber = true
