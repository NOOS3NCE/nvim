local cmp = require 'cmp'
local nvim_lsp = require 'lspconfig'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
			{ name = 'buffer' },
		})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
			{ name = 'buffer' },
		})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
			{ name = 'cmdline' }
		})
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
local map = vim.api.nvim_set_keymap
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {})
	map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
	map("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", {})
	-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

-- Set up lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- Enable the following language servers. If you ever find yourself needing another programming language support, you'll have to find its LSP, add it to this list and make sure it is installed in your system! We'll go through installing tsserver together for TypeScript support.
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

local servers = { 'rust_analyzer', 'tsserver', 'gopls', 'solargraph' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		commands = {
			OrganizeImports = {
				organize_imports,
				description = "Organize Imports"
			}
		}
	}
end
-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" }
-- }

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Set completeopt to have a better completion experience.
vim.o.completeopt = 'menuone,noselect'



