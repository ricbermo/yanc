-- load packer
local packer = prequire("config.packer")

if not packer then return end

packer.startup(function(use)
  use {'wbthomason/packer.nvim', event = 'VimEnter'}


  use {
    'Pocco81/Catppuccino.nvim',
    event = 'VimEnter',
    config = function() require('config.colorscheme') end,
    disable = true,
  }

  use {
    'folke/tokyonight.nvim',
    event = 'VimEnter',
    config = function() require('config.tokyonight') end
  }

  use {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('config.gitsigns') end
  }

  use {
    'NTBBloodbath/galaxyline.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('galaxyline.themes.eviline') end
  }

  use {
    'akinsho/bufferline.nvim',
    after = 'galaxyline.nvim',
    config = function() require('config.bufferline') end
  }

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
    config = function() require('config.nvimtree') end
  }

  use {
    'hrsh7th/nvim-cmp',
    wants = 'LuaSnip',
    requires = {
      {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
      {"hrsh7th/cmp-path", after = 'cmp-buffer'},
      {
        'L3MON4D3/LuaSnip',
        wants = 'friendly-snippets',
        config = function() require 'config.luasnip' end
      },
      {'rafamadriz/friendly-snippets'},
      {'saadparwaiz1/cmp_luasnip', after = 'LuaSnip'}
    },
    config = function() require('config.cmp') end
  }

  use {
    'williamboman/nvim-lsp-installer',
    config = function() require('config.lsp_installer') end
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

  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }

  use {'LionC/nest.nvim'}

  use {'folke/which-key.nvim'}

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function() require('config.blankline') end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function() require('config.colorizer') end
  }

  use {
    'karb94/neoscroll.nvim',
    event = 'BufEnter',
    config = function() require('config.neoscroll') end
  }

  use {
    'steelsojka/pears.nvim',
    event = 'BufEnter',
    config = function() require('pears').setup() end
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('config.comments') end
  }

  use {
    'blackCauldron7/surround.nvim',
    event = 'BufEnter',
    config = function() require('config.surround') end
  }

  use {
    'rcarriga/vim-ultest',
    requires = {'vim-test/vim-test'},
    run = ':UpdateRemotePlugins',
    config = function() require('config.testing') end,
    event = 'BufEnter',
  }

  use {
    'mattn/emmet-vim',
    event = 'BufEnter',
  }

end)
