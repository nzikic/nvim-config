local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
cmp.setup({
    sources = { { name = 'nvim_lsp'} },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavcmp_select }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true })
    }
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'clangd', 'cmake', 'bashls', 'tsserver', 'eslint', 'angularls', 'lua_ls' },
	handlers = { lsp_zero.default_setup }
})

