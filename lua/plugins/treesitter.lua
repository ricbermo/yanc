return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = { "OXY2DEV/markview.nvim" },
  config = function()
    require("nvim-treesitter").install({
      "lua",
      "vim",
      "vimdoc",
      "c",
      "javascript",
      "json",
      "typescript",
      "tsx",
      "markdown",
      "markdown_inline",
      "python",
      "ruby",
      "css",
      "html",
      "gitignore",
      "yaml",
      "typst",
      "latex",
    })
  end,
}
