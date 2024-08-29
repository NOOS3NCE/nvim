-- Install packer. You don't have to necessarily understand this code. Just know that it will grab packer from the Internet and install it for you.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Here we can declare the plugins we'll be using.
local use = require('packer').use
require('packer').startup(function()
	use {
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup()
		end
	}
	use 'andrewradev/splitjoin.vim'
	use 'voldikss/vim-floaterm'
	use 'numToStr/Comment.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'f-person/git-blame.nvim'
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use {
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require('treesitter-context').setup({
				 multiline_threshold = 1,
			})
		end
	}
	--AUTOCOMPLETE
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use {
		'nvim-pack/nvim-spectre',
		config = function()
			require('spectre').setup()
		end
	}
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
				italic = {
					strings = true,
					operators = true,
					comments = true,
				},
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
	use 'nvim-tree/nvim-web-devicons'
	use 'jose-elias-alvarez/null-ls.nvim'
	use {
		'MunifTanjim/prettier.nvim',
		config = function()
			require("prettier").setup({
			  bin = 'prettierd',
			  filetypes = {
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"markdown",
				"scss",
				"typescript",
				"typescriptreact",
				"yaml",
			  },
			})
		end
	}
	use 'ThePrimeagen/harpoon'
	use "LinArcX/telescope-command-palette.nvim"
	--DASHBOARD
	use 'lukas-reineke/indent-blankline.nvim'
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'lewis6991/gitsigns.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('gitsigns').setup()
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
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension "file_browser"
		end
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
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
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
	-- Hover
	use {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                require('hover.providers.man')
                -- require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = nil
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true,
			mouse_delay = 1000
        }

        -- Setup keymaps
        vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
        vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
    end
}
end)
