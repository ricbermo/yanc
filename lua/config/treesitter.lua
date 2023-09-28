local treesitter_config = prequire "nvim-treesitter.configs"
if not treesitter_config then
  return
end

treesitter_config.setup {
  ensure_installed = {
    "lua",
    "vim",
    "c",
    "javascript",
    "json",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    -- "python",
    -- "ruby",
    -- "css",
    -- "html",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
