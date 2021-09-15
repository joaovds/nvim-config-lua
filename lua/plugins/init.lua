local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- file managing
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvimtree"
    end
  }

  use "kyazdani42/nvim-web-devicons"

  -- theme
  use "kyazdani42/blue-moon"

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    config = function ()
      require "plugins.configs.bufferline"
    end
  }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require "plugins.configs.treesitter"
    end,
  }

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = {
      {'nvim-lua/plenary.nvim'},
    },
    config = function()
      require "plugins.configs.telescope"
    end
  }

  -- coc.nvim
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- git stuff
  use {
    "lewis6991/gitsigns.nvim",
    opt = true,
    config = function()
      require "plugins.configs.gitsigns"
    end,
  }

  -- statusline
  use {
    "famiu/feline.nvim",
    config = function()
      require "plugins.configs.statusline"
    end,
  }
end)
