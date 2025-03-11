return {
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    expand = function (args)
                        vim.snippet.expand(args.body)
                    end
                },
                sources = {
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavcmp_select }),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true })
                })
            })

            cmp.event:on('menu_opened', function()
                vim.b.copilot_suggestion_hidden = true
            end)

            cmp.event:on('menu_closed', function()
                vim.b.copilot_suggestion_hidden = false
            end)
        end
    }
}
