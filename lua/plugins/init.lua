-- This file can be loaded by calling `lua require('plugins')` from your init.vim
build_with_config = function(package_name)
  return function()
    require('config.' .. package_name)
  end
end
return {

  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require('ayu').setup({
        mirage = true,
      })
      require('ayu').colorscheme()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = build_with_config('treesitter')
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = build_with_config('bufferline')
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = build_with_config('nvim-tree'),
    cmd = "NvimTreeToggle"
  },
  -- {
  --   "folke/noice.nvim",
  --   config = true,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
  },
  -- auto complete things like ()
  {
    'windwp/nvim-autopairs',
    config = build_with_config('autopairs'),
    event = 'BufRead'
  },
  -- colorize your parenthesis
  'p00f/nvim-ts-rainbow',
  'kdheepak/lazygit.nvim',
  -- for surrounding stuff with delimeters
  {
    "ur4ltz/surround.nvim",
    opts = { mappings_style = "surround" }
  },
  -- Will tell you where the keybindings go
  {
    'folke/which-key.nvim',
    event = 'BufWinEnter',
    config = build_with_config('whichkey')
  },

  -- Telescope extensions
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  -- fuzzy file finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    config = build_with_config('telescope')
  },
  -- LSP stuff
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  -- 'hrsh7th/cmp-vsnip',
  -- 'hrsh7th/vim-vsnip',
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'onsails/lspkind-nvim',
  { 'williamboman/mason.nvim',          config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig",            config = function() require('lsp') end },
  -- async formatting out of the box
  {
    "lukas-reineke/lsp-format.nvim",
    config = true
  },
  'ms-jpq/coq_nvim',
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = build_with_config('colorizer')
  },
  {
    'lewis6991/gitsigns.nvim',
    config = build_with_config('gitsigns')
  },
  -- marks
  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup({
        mappings = {
          next = "m<Right>",
          prev = "m<Left>"
        }
      })
    end,
    event = 'BufWinEnter'
  },

  -- auto save files
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        debounce_delay = 2000,
        execution_message = { cleaning_interval = 800 }
      }
    end,
  },

  -- Automatically toggle relative line numbers
  -- insert mode no relative
  -- normal mode relative
  "sitiom/nvim-numbertoggle",
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = build_with_config('blankline')
  },
  {
    'tamton-aquib/staline.nvim',
    config = build_with_config('staline'),
    lazy = false
  },

  -- allows you to comment out blocks of stuff
  {
    'numToStr/Comment.nvim',
    config = build_with_config('comment')
  },
  -- Shows you all the bad shit that's happening in your code
  {
    'folke/trouble.nvim',
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = true,
    cmd = "Trouble"
  },
  -- navigation
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat'
    },
    config = function()
      require('leap').set_default_keymaps()
    end,
    event = "VeryLazy"
  },

  {
    'https://gitlab.com/yorickpeterse/nvim-window',
    name = 'nvim-window'
  },

  -- session management, this thing is awesome
  {
    'rmagatti/auto-session',
    opts = {
      log_level = 'info',
      auto_session_suppress_dirs = { '~/', '~/Projects' }
    }
  },
  -- keeps your buffer content from moving when you open windows beneath it
  {
    "luukvbaal/stabilize.nvim",
    config = true,
    event = "VeryLazy"
  },

  { 'nvim-treesitter/nvim-treesitter-context', event = "VeryLazy" },

}
