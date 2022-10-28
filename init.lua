require('telescope').load_extension('harpoon')
require('telescope').load_extension('git_worktree')
require('plugins')
require('keybindings')
require('plugs.cmp')
require('plugs.gitsigns')
require('lualine').setup {
	options = { theme = 'gruvbox' }
}
--NOT WORKING
require('telescope')
--require("lsp")

--Plugin specific configs.
require('plugs.treesitter')
require('neoscroll').setup()
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
    show_end_of_line = true,
}
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.softtabstop = -1
vim.opt.cmdheight = 1
vim.opt.showtabline = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Set pop up menus bgs to transparent, also sign column
vim.cmd([[
augroup my_color_scheme
  autocmd!
  autocmd ColorScheme * highlight Pmenu guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
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
vim.opt.updatetime = 150
vim.wo.signcolumn = 'yes'

-- Set colorscheme defaults (order is important here).
vim.o.termguicolors = true
vim.o.background = 'dark'
require('gruvbox').setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false, -- invert background for search, diffs, statuslines and errors
  contrast = '', -- can be "hard", "soft" or empty string
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
})
-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
