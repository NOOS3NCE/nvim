 -- PLUGINS
 
-- Install packer. You don't have to necessarily understand this code. Just know that it will grab packer from the Internet and install it for you.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Here we can declare the plugins we'll be using.
local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'
    use "lukas-reineke/indent-blankline.nvim"
	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'ellisonleao/gruvbox.nvim' 
	use 'karb94/neoscroll.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'airblade/vim-gitgutter'
	use 'ThePrimeagen/harpoon'
	use 'ThePrimeagen/git-worktree.nvim'
	use "LinArcX/telescope-command-palette.nvim"
	use 'skanehira/getpr'
	use 'skanehira/getpr.vim'
	use 'APZelos/blamer.nvim'
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' } 
	use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {
		 'folke/which-key.nvim',
		 config = function()
			 require("which-key").setup {
			 }
		 end
	}
	use {
		 'nvim-lualine/lualine.nvim',
		 requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		 'nvim-tree/nvim-tree.lua',
		 requires = {
			 'nvim-tree/nvim-web-devicons',
		 },
		 tag = 'nightly'
	}
	use {
	  'folke/trouble.nvim',
	  requires = 'kyazdani42/nvim-web-devicons',
	  config = function()
	    require('trouble').setup {
	    }
	  end
	}
	use {
	  'folke/todo-comments.nvim',
	  requires = 'nvim-lua/plenary.nvim',
	  config = function()
	    require('todo-comments').setup {
	    }
	  end
	}
	use {
		 'nvim-telescope/telescope.nvim', tag = '0.1.0',
		 requires = { {'nvim-lua/plenary.nvim'} }
	}
end)

-- luasnip setup (you can leave this here or move it to its own configuration file in `lua/plugs/luasnip.lua`.)
luasnip = require 'luasnip'
	
