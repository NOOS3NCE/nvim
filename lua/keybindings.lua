
-- plugin specific keybindings are in the plugin's config files.

-- remap space as leader key. leader key is a special key that will allow us to make some additional keybindings. i'm using a spacebar, but you can use whatever you'd wish. we'll use it (for example) for searching and changing files (by pressing spacebar, then `s` and then `f`).
vim.api.nvim_set_keymap('', '<space>', '<nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.timeoutlen = 50
local wk = require("which-key")
-- remap for dealing with word wrap. in general, the `nvim_set_keymap` is the function we can use to create any keymap you'd wish. i tend to keep those related to the whole editor here, while leaving the ones for specific plugins to their own configuration files. that way if i ever remove or change plugins i can keep my keybindings clean.
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
--Keep screen centered
vim.cmd(":noremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>")

--prettier partial visual mode
vim.cmd("vnoremap <leader>gt :'<,'>prettierpartial<cr>")

--sort selection alphabetically
vim.cmd("vnoremap <leader>ga :'<,'>sort u<cr>")

--ORGANIZE TYPESCRIPT IMPORTS
vim.cmd("noremap <leader>gi :OrganizeImports<CR>")

--YANK/PASTE FROM CLIPBOARD
vim.cmd('noremap y "*y')
vim.cmd('noremap y "*y')
vim.cmd('noremap p "*p')
vim.cmd('noremap p "*p')

--MOVE LINES UP AND DOWN
vim.cmd("vnoremap <S-j> :m '>+1<CR>gv=gv")
vim.cmd("vnoremap <S-k> :m '<-2<CR>gv=gv")

--NVIM TREE 
vim.cmd("noremap <leader>e :NvimTreeToggle<CR>")
vim.cmd("noremap <leader>tf :NvimTreeFindFile<CR>")

--TROUBLE
vim.cmd("noremap <leader>tt :TroubleToggle<CR>")

--INDENT
vim.cmd("vnoremap > >gv")
vim.cmd("vnoremap < <gv")

--HARPOON
vim.cmd('nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>')
vim.cmd('nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>')
vim.cmd('nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>')
vim.cmd('nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<CR>')
vim.cmd('nnoremap <C-i> :lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.cmd('nnoremap <C-a> :lua require("harpoon.mark").add_file()<CR>')
vim.cmd('nnoremap <leader><c-r> :lua require("harpoon.mark").rm_file()<cr>')

--WORKTREES
vim.cmd('nnoremap <leader>ye :lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
vim.cmd('nnoremap <leader>yc :lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

vim.cmd('noremap <leader>bt :BlamerToggle<CR>')
vim.cmd('noremap <leader>bg :GetprOpen<CR>')

--LSP QoL
vim.cmd('noremap gh :lua vim.lsp.buf.hover()<CR>')

-- TELESCOPE
wk.register({
	["<leader>f"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find File" },
	["<leader>st"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
	["<leader>sb"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List Buffers" },
	["<leader>sf"] = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "List Quickfix" },
	["<leader>sj"] = { "<cmd>lua require('telescope.builtin').jumplist()<cr>", "List Jumps" },
})

-- WINDOW
wk.register({
	["<leader>w"] = { name = "Window" },
	["<leader>wv"] = { "<cmd> vsplit<CR>", "Vertical Split" },
})

--SAVE
--vim.cmd('nnoremap <c-s> :w<CR>')
--BARBAR
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
