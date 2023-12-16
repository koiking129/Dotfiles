local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require('setup/nvim-tree').config
  },

  -- Fuzzy search
  'junegunn/fzf',
  {
    'junegunn/fzf.vim',
    config = require('setup/fzf').config
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim', version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require("setup/bufferline").config
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = require('setup/lualine').config
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  -- Color
  'folke/tokyonight.nvim',
  'dracula/vim',
  'HiPhish/rainbow-delimiters.nvim',

  -- Completion
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = require('setup/coc').config
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = require('setup/nvim-treesitter').config
  },

  -- Command prompt
  {
    'gelguy/wilder.nvim',
    event = 'CmdLineEnter',
    config = require('setup/wilder').config
  },

  -- Input Method (im)
  {
    'Zhniing/im-select.nvim',
    branch = 'feat',
    config = require('setup/im-select').config
  },

  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    config = require('setup/gitsigns').config
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },  -- Lazy-load on filetype
  },

  -- Miscellaneous
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  },
})
