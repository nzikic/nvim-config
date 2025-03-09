vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function ()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Lsp actions',
    callback = function (event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    end
})
