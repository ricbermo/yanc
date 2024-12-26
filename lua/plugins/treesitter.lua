return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  cmd = {
    "TSUpdate",
    "TSInstallInfo",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
    "TSUninstall",
  },
  opts = {
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
  },
}
