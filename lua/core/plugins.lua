local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	--THEMES--
	use {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}
	--TELESCOPE--
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- COC --
	use { 'neoclide/coc.nvim', branch='release' }
	-- SURROUND --
	use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
        require("nvim-surround").setup({})
    end
	}
	-- MARKDOWN PREVIEW
	use {'iamcco/markdown-preview.nvim'}
	-- Mason
	use {
			"neovim/nvim-lspconfig",
	}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
