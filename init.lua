require('plugins')
require('keybindings')
require('lsp')
require('telescope').load_extension('harpoon')
require('telescope').load_extension('git_worktree')
require('lualine').setup {
	options = { theme = 'gruvbox' }
}
require('lualine').hide({
	place = { 'tabline' }, -- The segment this change applies to.
	unhide = false,  -- whether to reenable lualine again/
})
require'lspconfig'.eslint.setup{}
--Indents word-wrapped lines as much as the 'parent' line
vim.cmd('set breakindent')
--Ensures word-wrap does not split words
vim.cmd('set formatoptions=l')
vim.cmd('set lbr')

vim.cmd('set clipboard+=unnamedplus')
vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
--NOT WORKING
--AUTO RELOAD ON FILE UPDATE
vim.cmd([[
	" trigger `autoread` when files changes on disk
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    " notification after file change
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

--Plugin specific configs.
vim.cmd("set termguicolors")
require('plugs.gitsigns')
require('plugs.treesitter')
require('plugs.cmp')
require('plugs.telescope')
require("mason").setup()
require('dashboard').setup()
require('neoscroll').setup()
require'colorizer'.setup()
require('Comment').setup({
	toggler = {
		---Line-comment toggle keymap
		line = '<leader>/',
	},
	opleader = {
		---Line-comment toggle keymap
		-- line = '<leader>/',
		block = '<leader>/',
	}
})

vim.opt.list = true
--vim.opt.listchars:append "space:"
require("indent_blankline").setup {
	-- space_char_blankline = "",
}
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.softtabstop = -1
vim.opt.cmdheight = 1
vim.opt.showtabline = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
-- Set pop up menus bgs to transparent, also sign column
vim.cmd([[
augroup my_color_scheme
	autocmd!
	autocmd ColorScheme * highlight Pmenu guibg=NONE ctermbg=NONE
	autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
	autocmd ColorScheme * highlight VertSplit guibg=NONE ctermbg=NONE
	autocmd ColorScheme * highlight BufferLineBackground guibg=NONE ctermbg=NONE
augroup END ]])

-- set no expand tab on opening any file (need this fix for ruby files)
vim.cmd('autocmd FileType ruby setlocal noexpandtab shiftwidth=4 tabstop=4')

-- Set highlight on search. This will remove the highlight after searching for text.
vim.o.hlsearch = false

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable break indent.
--vim.opt.breakindent = true

-- Save undo history.
--vim.opt.undofile = true

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time.
vim.opt.updatetime = 50
vim.wo.signcolumn = 'yes'
vim.color_column = 100

-- Set colorscheme defaults (order is important here).
vim.o.termguicolors = true
vim.o.background = 'dark'
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
vim.cmd('colorscheme gruvbox')

--NVIM TREE SETUP
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require('nvim-tree').setup()
require('harpoon').setup({
	mark_branch = true,
	menu = {
		-- width = vim.api.nvim_win_get_width(0) - 20,
		width = 100,
	}
})
-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
	 [[
	 augroup YankHighlight
		 autocmd!
		 hi IncSearch ctermbg=255 guibg=#FFFFFF
		 autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	 augroup end
]],
  false
)
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
ls.add_snippets("all", {
	s("/todo", {
		t({"- [ ] "}), i(1),
	})
})
