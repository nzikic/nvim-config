return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            {'williamboman/mason.nvim'},
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {},
                automatic_installation = false,
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })

            require('lspconfig').clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy"
                }
            })
            require('lspconfig').qmlls.setup({ cmd = { "qmlls6" } })
        end,
    },
}
