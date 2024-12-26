return {
  { "folke/which-key.nvim" },
  { "kevinhwang91/nvim-bqf", ft = "qf" },
  {
    "mattn/emmet-vim",
    event = "BufReadPost",
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "html",
      "css",
    },
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "gg", "G" },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    keys = { "ys", "ds", "cs" },
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",
    opts = {
      scope = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "config.lsp"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPost",
    dependencies = {
      "lukas-reineke/lsp-format.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "config.null_ls"
    end,
  },
}
