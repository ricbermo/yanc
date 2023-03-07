-- All plugins are lazy-loaded by default
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function() require('config.catppuccin') end,
    build = ':CatppuccinCompile',
    lazy = false
  },

  {
    'kyazdani42/nvim-web-devicons',
    event = 'BufRead'
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.lualine') end
  },

  {
    'akinsho/bufferline.nvim',
    event = 'BufReadPre',
    config = function() require('config.bufferline') end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = function() require('config.blankline') end
  },

  {
    url = 'https://gitlab.com/yorickpeterse/nvim-pqf.git',
    config = function() require('config.pqf') end
  },

  {
    'glepnir/lspsaga.nvim',
    cmd = { 'Lspsaga' },
    config = function() require('config.lspsaga') end,
  },

  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = {
      auto_open = false,
      use_diagnostic_signs = true,
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    cmd = {
      'TSUpdate',
      'TSInstallInfo',
      'TSEnable',
      'TSDisable',
      'TSModuleInfo',
      'TSUninstall',
    },
    config = function() require('config.treesitter') end
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'molecule-man/telescope-menufacture' }
    },
    cmd = 'Telescope',
    config = function() require('config.telescope') end
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = function() require('config.neotree') end,
  },

  { 'nvim-pack/nvim-spectre' },

  {
    'goolord/alpha-nvim',
    lazy = false,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.alpha') end
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
    config = function() require('config.luasnip') end
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'saadparwaiz1/cmp_luasnip' }
    },
    config = function() require('config.cmp') end
  },

  {
    'williamboman/mason.nvim',
    cmd = {
      'Mason',
      'MasonInstall',
      'MasonUninstall',
      'MasonUninstallAll',
      'MasonLog'
    },
    config = function() require('config.mason') end,
  },

  {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim'
    },
    config = function() require('config.lsp') end,
  },

  { 'folke/which-key.nvim' },

  {
    'karb94/neoscroll.nvim',
    keys = { '<C-u>', '<C-d>', 'gg', 'G' },
    config = function() require('config.neoscroll') end
  },

  {
    'steelsojka/pears.nvim',
    event = 'InsertEnter',
    config = function() require("pears").setup() end
  },

  {
    'numToStr/Comment.nvim',
    keys = { 'gc' },
    config = true,
  },

  {
    'kylechui/nvim-surround',
    keys = { 'ys', 'ds', 'cs' },
    config = true,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest'
    },
    config = function() require('config.testing') end,
  },

  {
    'kevinhwang91/nvim-ufo',
    event = 'BufReadPost',
    dependencies = {
      'kevinhwang91/promise-async'
    },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    }
  },

  {
    'luukvbaal/statuscol.nvim',
    event = 'BufReadPost',
    config = function() require('config.statuscol') end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.gitsigns') end
  },

  {
    'mattn/emmet-vim',
    event = 'BufReadPost',
    ft = {
      'typescript',
      'typescriptreact',
      'javascript',
      'javascriptreact',
      'html',
      'css',
    }
  },

  {'akinsho/toggleterm.nvim', version = "*", config = true}
}
