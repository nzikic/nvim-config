return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files in source control" })

        vim.keymap.set('n', '<leader>fWs', function ()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        -- Clone the default telescope configuration
        local telescopeConfig = require('telescope.config')
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
        table.insert(vimgrep_arguments, "--hidden") -- search in dotfiles
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*") -- dont search '.git' dir

        local telescope = require('telescope')
        telescope.setup({
            vimgrep_arguments = vimgrep_arguments,
            preview = { filesize = 1 --[[ MB --]] },
            pickers = { find_files = { theme = "ivy" } },
            extensions = { fzf = {} },
        })

        telescope.load_extension('fzf')
    end
}
