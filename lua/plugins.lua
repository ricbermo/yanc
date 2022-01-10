-- load packer
local packer = prequire("config.packer")

if not packer then return end

packer.startup(function(use)
  use {'wbthomason/packer.nvim', event = 'VimEnter'}

  -- Eye Candy

  use {
    'rebelot/kanagawa.nvim',
    event = 'VimEnter',
    config = function() require('config.kanagawa') end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    event = "BufRead"
  }

  use {
    'NTBBloodbath/galaxyline.nvim',
    after = "nvim-web-devicons",
    config = function() require('galaxyline.themes.eviline') end
  }

  use {
    'akinsho/bufferline.nvim',
    after = 'galaxyline.nvim',
    config = function() require('config.bufferline') end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function() require('config.blankline') end
  }

  -- File Management

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    config = function() require('config.treesitter') end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    cmd = 'Telescope',
    config = function() require('config.telescope') end
  }

  use {
    'glepnir/dashboard-nvim',
    config = function() require('config.dashboard') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('config.nvimtree') end,
    event = 'BufRead',
  }

  -- LSP & Completion

  use {'rafamadriz/friendly-snippets'}

  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
    config = function() require 'config.luasnip' end
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'LuaSnip',
    requires = {
      {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
      {'hrsh7th/cmp-path', after = 'nvim-cmp'},
      {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'}
    },
    config = function() require('config.cmp') end
  }

  use {
    'williamboman/nvim-lsp-installer',
    config = function() require('config.lsp_installer') end,
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    config = function() require('config.lsp') end
  }

  use {
    'tami5/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function() require('config.lspsaga') end
  }

  use {
    'ray-x/lsp_signature.nvim',
    after = 'nvim-lspconfig',
    disable = true,
    config = function() require('config.signature') end
  }

  -- Utils

  use {'LionC/nest.nvim'}

  use {'folke/which-key.nvim'}

  use {
    'karb94/neoscroll.nvim',
    event = 'BufRead',
    config = function() require('config.neoscroll') end
  }

  use {
    'steelsojka/pears.nvim',
    event = 'BufRead',
    config = function() require('pears').setup() end
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('config.comments') end,
    event = 'BufRead',
  }

  use {
    'blackCauldron7/surround.nvim',
    event = 'BufRead',
    config = function() require('config.surround') end
  }

  use {
    'rcarriga/vim-ultest',
    requires = {'vim-test/vim-test'},
    run = ':UpdateRemotePlugins',
    setup = function() require('config.testing') end,
    event = 'BufRead',
  }

  use {
    'mattn/emmet-vim',
    event = 'BufRead',
  }

  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('config.gitsigns') end
  }

end)
