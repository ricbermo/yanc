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

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
