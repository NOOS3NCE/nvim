
-- Plugin specific keybindings are in the plugin's config files.

-- Remap space as leader key. Leader key is a special key that will allow us to make some additional keybindings. I'm using a spacebar, but you can use whatever you'd wish. We'll use it (for example) for searching and changing files (by pressing spacebar, then `s` and then `f`).
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.timeoutlen = 50
local wk = require("which-key")
-- Remap for dealing with word wrap. In general, the `nvim_set_keymap` is the function we can use to create any keymap you'd wish. I tend to keep those related to the whole editor here, while leaving the ones for specific plugins to their own configuration files. That way if I ever remove or change plugins I can keep my keybindings clean.
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--YANK/PASTE FROM CLIPBOARD
vim.cmd('noremap y "*y')
vim.cmd('noremap Y "*Y')
vim.cmd('noremap p "*p')
vim.cmd('noremap P "*P')

--MOVE LINES UP AND DOWN
vim.cmd("vnoremap <S-j> :m '>+1<CR>gv=gv")
vim.cmd("vnoremap <S-k> :m '<-2<CR>gv=gv")

--NVIM TREE 
vim.cmd("noremap <leader>e :NvimTreeToggle<CR>")
vim.cmd("noremap <leader>tf :NvimTreeFindFile<CR>")

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

-- TELESCOPE
wk.register({
	["<leader>f"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find File" },
	["<leader>st"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
	["<leader>sb"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List Buffers" },
})

-- WINDOW
wk.register({
	["<leader>w"] = { name = "Window" },
	["<leader>wv"] = { "<cmd> vsplit<CR>", "Vertical Split" },
})

--AUTOSAVE
-- vim.cmd('nnoremap <leader>n :ASToggle<CR>')
