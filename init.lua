require('plugins')
require('keybindings')
require('lsp')
require('telescope').load_extension('harpoon')
require('lualine').setup {
	options = { theme = 'gruvbox' }
}
require('lualine').hide({
	place = { 'tabline' }, -- The segment this change applies to.
	unhide = false,  -- whether to reenable lualine again/
})
require'lspconfig'.eslint.setup{}
vim.opt.signcolumn = "yes" -- otherwise it bounces in and out, not strictly needed though
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
      " autocmd FileChangedShellPost *
        " \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])
vim.diagnostic.config({
  virtual_text = false
})
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
--Plugin specific configs.
vim.cmd("set termguicolors")
-- require('plugs.gitsigns')
require('plugs.treesitter')
require('plugs.cmp')
require('plugs.telescope')
--require('plugs.dap')
--require('plugs.dapui')
require("mason").setup({ PATH = "prepend" })
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
-- vim.opt.listchars:append "space:"
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
	autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
	autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
augroup END ]])

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
vim.opt.updatetime = 20
vim.wo.signcolumn = 'yes'
vim.color_column = 80

-- Set colorscheme defaults (order is important here).
vim.o.termguicolors = true
vim.o.background = 'dark'
-- COLOR SCHEME
vim.cmd('colorscheme gruvbox')
-- vim.cmd('colorscheme kanagawa-wave')

-- empty setup using defaults
-- require('harpoon').setup({
-- 	mark_branch = true,
-- 	menu = {
-- 		-- width = vim.api.nvim_win_get_width(0) - 20,
-- 		width = 100,
-- 	}
-- })
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
--[[
-- set no expand tab on opening any file (need this fix for ruby files)
vim.cmd('autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2')
vim.cmd('autocmd FileType ruby setlocal expandtab')

-- https://github.com/neovim/neovim/issues/21749#issuecomment-1378720864
-- Fix loading of json5
table.insert(vim._so_trails, "/?.dylib")

require('dap.ext.vscode').load_launchjs(nil,
  { ['pwa-node'] = js_based_languages,
    ['node'] = js_based_languages,
    ['chrome'] = js_based_languages,
    ['pwa-chrome'] = js_based_languages }
) ]]
