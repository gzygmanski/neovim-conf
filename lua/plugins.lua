local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  },

  -- Useful status updates for LSP
  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  -- { "j-hui/fidget.nvim", opts = {} },

  -- Additional lua configuration, makes nvim stuff amazing!
  "nvimtools/none-ls.nvim",
  { 'gzygmanski/nord-vim',     branch = 'develop' },
  -- 'elihunter173/dirbuf.nvim',
  'nvim-tree/nvim-tree.lua',
  'romgrk/barbar.nvim',
  'tpope/vim-surround',
  'sindrets/diffview.nvim',
  { 'glepnir/galaxyline.nvim', branch = 'main' },
  { 'numToStr/Comment.nvim',   opts = {} },
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'mattn/emmet-vim' },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(
        require('nvim-treesitter.install').update {
          with_sync = true,
        }
      )
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    -- ft = "markdown",
    -- event = {
    --   "BufReadPre " .. vim.fn.expand "~" .. "/vaults/noteshiss/**",
    --   "BufNewFile " .. vim.fn.expand "~" .. "/vaults/noteshiss/**",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }
}
