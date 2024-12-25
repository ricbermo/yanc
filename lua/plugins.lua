-- All plugins are lazy-loaded by default
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require "config.catppuccin"
    end,
    build = ":CatppuccinCompile",
    lazy = false,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
    config = function()
      require "config.lualine"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "BufReadPost",
    config = function()
      require "config.bufferline"
    end,
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
    config = function()
      require "config.treesitter"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "molecule-man/telescope-menufacture" },
    },
    cmd = "Telescope",
    config = function()
      require "config.telescope"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeFindFileToggle" },
    config = function()
      require "config.nvimtree"
    end,
  },

  {
    "saghen/blink.cmp",
    version = "v0.8.2",
    event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      keymap = { preset = "super-tab" },
      completion = {
        menu = { border = "single" },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "rounded" }, enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    config = function()
      require "config.mason"
    end,
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
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "config.gitsigns"
    end,
  },

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

  { "folke/which-key.nvim" },

  { "kevinhwang91/nvim-bqf", ft = "qf" },
}
