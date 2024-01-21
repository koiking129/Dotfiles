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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = require('setup.neo-tree').config
  },

  -- Fuzzy search
  'junegunn/fzf',
  {
    'junegunn/fzf.vim',
    config = require('setup/fzf').config
  },

  -- Directory navigation
  'nanotee/zoxide.vim',

  -- Bufferline
  {
    'akinsho/bufferline.nvim', version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require("setup/bufferline").config
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require('setup/lualine').config
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- Color
  'folke/tokyonight.nvim',
  'HiPhish/rainbow-delimiters.nvim',
  {
    'dracula/vim',
    -- Clarify the "dracula" instead of the ambiguous "vim"
    name = "dracula",
    config = function ()
      vim.cmd("colorscheme dracula")
    end
  },

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
  -- Highlight other uses of the word under the cursor
  {
    "rrethy/vim-illuminate",
    config = require('setup.vim-illuminate').config,
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
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop"
    },
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = require("setup/markdown-preview").config,
  },

  -- Competitive programming
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = require('setup/competitest').config,
  },

  -- Debug
  {
    "mfussenegger/nvim-dap",
    config = require("setup/nvim-dap").config,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = require("setup/nvim-dap-ui").config,
  },

  -- Float terminal
  {
    "voldikss/vim-floaterm",
    config = require("setup/vim-floaterm").config,
  },

  -- Surroundings
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    opts = {
      root_key = "S",  -- Triggered by <leader>S
    }
  },

  -- Expand or collapse nested code blocks
  {
    'Wansmer/treesj',
    keys = {'<space>m', '<space>j', '<space>s'},
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    opts = {},
  },

  -- Keymap hint
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  -- Web broswer embedded
  {
    'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
    build = function ()
      vim.fn["firenvim#install"](0)
    end
  },

  -- Color preview
  {
    'norcalli/nvim-colorizer.lua',
    opts = {'*'},  -- Enable for any filetypes
  },

  -- Indent
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = require('setup.ibl').config
  },

  -- Miscellaneous
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  },
})
