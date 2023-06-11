 -- PLUGINS
 
-- Install packer. You don't have to necessarily understand this code. Just know that it will grab packer from the Internet and install it for you.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Here we can declare the plugins we'll be using.
local use = require('packer').use
require('packer').startup(function()
	use 'numToStr/Comment.nvim'
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-treesitter/nvim-treesitter-context'
	--AUTOCOMPLETE
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	--GIT
	use {
	  'pwntester/octo.nvim',
	  requires = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
		'nvim-tree/nvim-web-devicons',
	  },
	  config = function ()
		require"octo".setup()
	  end
	}
	--COLORSCHEMES
	use {
		'ellisonleao/gruvbox.nvim',
		config = function()
			require('gruvbox').setup({
				undercurl = true,
				underline = true,
				bold = false,
				italic = true,
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = false, -- invert background for search, diffs, statuslines and errors
				contrast = 'hard', -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
		end
	}
	use {
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup()
		end
	}
	use 'karb94/neoscroll.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'prettier/vim-prettier'
	use 'airblade/vim-gitgutter'
	use 'ThePrimeagen/harpoon'
	use 'ThePrimeagen/git-worktree.nvim'
	use "LinArcX/telescope-command-palette.nvim"
	use 'skanehira/getpr'
	use 'skanehira/getpr.vim'
	use 'APZelos/blamer.nvim'
	use 'norcalli/nvim-colorizer.lua'
	--DASHBOARD
	use {
		'glepnir/dashboard-nvim',
		after = 'persisted.nvim',
		config = function()
			require('dashboard').setup()
		end
	}
	use {
	  'lukas-reineke/indent-blankline.nvim',
	  config = function()
		require("indent_blankline").setup { filetype_exclude = { "dashboard" }
		}
	  end
	}
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' } 
	use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {
		'simrat39/symbols-outline.nvim',
		config = function()
			require('symbols-outline').setup()
		end
	}
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
			require('trouble').setup {}
		end
	}
	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('todo-comments').setup {}
		end
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {
				write_all_buffers = true,
			}
		end,
	}

	use({
	  "olimorris/persisted.nvim",
	  config = function()
	  require("persisted").setup({
			autoload = true,
			use_git_branch = true,
		})end,
	})
	use {
		 'williamboman/mason.nvim',
	}
end)

-- luasnip setup (you can leave this here or move it to its own configuration file in `lua/plugs/luasnip.lua`.)
luasnip = require 'luasnip'
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)	
require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')
local luasnip = require('luasnip') 
local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})

local function setup_lsp_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )
end
