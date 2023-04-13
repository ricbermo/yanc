local treesitter_config = prequire("nvim-treesitter.configs")
if not treesitter_config then return end

treesitter_config.setup({
  ensure_installed = {
    "javascript",
    "ruby",
    "css",
    "html",
    "dart",
    "json",
    "typescript",
    "tsx",
    "lua",
    "vim",
    "markdown",
    "markdown_inline"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
})
