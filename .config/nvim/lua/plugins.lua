local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = require('setup/nvim-tree').config
  }

  -- Fuzzy search
  -- use fzf installed by apt in debian (avoid duplicate installation)
  vim.opt.rtp:append('/usr/share/doc/fzf/examples')
  use {'junegunn/fzf.vim', config=require('setup/fzf').config}

  -- Bufferline
  use {
    'akinsho/bufferline.nvim', tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = require("setup/bufferline").config
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim/nvim-web-devicons', opt = true },
    config = require('setup/lualine').config
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = "require('Comment').setup()"
  }

  -- Color
  use 'folke/tokyonight.nvim'

  -- Completion
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = require('setup/coc').config
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('setup/nvim-treesitter').config,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

