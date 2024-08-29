-- Telescope
require('telescope').setup {
	defaults = {
		layout_config ={
			horizontal= {
				width = 0.99,
				height = 0.99,
				}
			},
		-- path_display = {"truncate"},
		mappings = {
		  n = {
			['<c-d>'] = require('telescope.actions').delete_buffer,
		  },
		  i = {
			['<C-u>'] = false,
			['<C-d>'] = require('telescope.actions').delete_buffer,
		  },
    },
  },
}
-- Add leader shortcuts.
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sco', [[<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sci', [[<cmd>lua require('telescope.builtin').lsp_incoming_calls()<CR>]], { noremap = true, silent = true })


