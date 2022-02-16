vim.cmd([[
  hi link NeoTreeDirectoryName Directory
  hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
]])

local neotree = prequire('neo-tree')
if not neotree then
  return
end

neotree.setup({
  close_if_last_window = false,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
      highlight = "NeoTreeDimText", -- if you remove this the status will be colorful
    },
  },
})
