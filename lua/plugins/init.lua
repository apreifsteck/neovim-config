-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- TODO: save on buffer focus lost
-- TODO: Shade the inactive window?
-- TODO: status line
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- themes
  use 'shaunsingh/nord.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "Shatur/neovim-ayu" }
  use { "savq/melange" }
  -- end themes
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = "require('config.treesitter')"
  }
  -- using packer.nvim
  use { 'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('config.bufferline')"
  }
  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = "require('config.nvim-tree')"
  }
  -- terminal stuff
  -- use 'nikvdp/neomux'
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}
  --
  -- html tagging and stuff
  use {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    after = 'nvim-treesitter'
  }
  -- auto complete things like ()
  use {
    'windwp/nvim-autopairs',
    config = "require('config.autopairs')",
    after = 'nvim-cmp'
  }
  -- colorize your parenthesis
  use {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter'
  }
  -- git tool
  use { 'tpope/vim-fugitive' }
  -- for surrounding stuff with delimeters
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require "surround".setup { mappings_style = "surround" }
    end
  }
  -- Will tell you where the keybindings go
  use {
    'folke/which-key.nvim',
    event = 'BufWinEnter', config = "require('config.whichkey')"
  }

  -- fuzzy file finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    cmd = 'Telescope', config = "require('config.telescope')"
  }
  use { 'neovim/nvim-lspconfig', config = "require('lsp')" }
  -- use { 'glepnir/lspsaga.nvim', config = "require('config.lspsaga')"}
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'onsails/lspkind-nvim' }
  use({
        'williamboman/nvim-lsp-installer',
        config = function()
          local lsp_installer = require('nvim-lsp-installer')
          lsp_installer.setup{}
        end,
      })
  use('ms-jpq/coq_nvim')

  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead', config = "require('config.colorizer')"
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = "require('config.gitsigns')"
  }
  -- spell checking
  use { 'lewis6991/spellsitter.nvim' }
  use {
    'glepnir/dashboard-nvim',
    config = "require('config.dashboard')"
  }
  -- marks
  use { 'chentoast/marks.nvim',
    config = function()
      require('marks').setup({
        mappings = {
          next = "m<Right>",
          prev = "m<Left>"
        }
      })
    end
  }

  -- auto save files
  use {"Pocco81/AutoSave.nvim"}

  -- Automatically toggle relative line numbers 
  -- insert mode no relative
  -- normal mode relative
  use {
     "sitiom/nvim-numbertoggle",
     config = function()
        require("numbertoggle").setup()
     end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead', config = "require('config.blankline')"
  }
  -- lsp language server
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = "require('config.null-ls')"
  }
  -- opens a buffer in a full screen window
  use { "folke/zen-mode.nvim", config = "require('config.zen-mode')" }

  -- allows you to comment out blocks of stuff
  use {
    'numToStr/Comment.nvim',
    config = "require('config.comment')"
  }
  -- optimize vim loading
  use {
    'lewis6991/impatient.nvim'
  }
  -- Shows you all the bad shit that's happening in your code
  use {
    'folke/trouble.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('config.trouble')"
  }
 -- multi cursor support
  use {
    'mg979/vim-visual-multi'
  }
  -- navigation
  use {
    'ggandor/leap.nvim',
    requires = {
      'tpope/vim-repeat'
    },
    config = function()
      require('leap').set_default_keymaps()
    end
  }

  -- use {
  --   'stevearc/aerial.nvim',
  --   config = function() require('aerial').setup() end
  -- }

  -- code navigator
  use {
    'simrat39/symbols-outline.nvim'
  } 
  use {
    'https://gitlab.com/yorickpeterse/nvim-window',
    as = 'nvim-window'
  }
  use {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'info',
      auto_session_suppress_dirs = {'~/', '~/Projects'}
    }
  end
}
end)
