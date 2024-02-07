local builtin = require('telescope.builtin')
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files in current dir" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files in source control" })
-- these require 'ripgrep' to be installed on the OS
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Find Word under cusror" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "See open buffers" })

-- Clone the default telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden") -- search in dot files
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
        preview = {
            filesize_limit = 1, -- in MB
        }
    },
    pickers = {
    },
})

