local generate_rg_command = function(prompt)
    if not prompt or prompt == "" then
        return nil
    end

    local args = { "rg" }

    local delimiter_2_spaces = "  "
    local pieces = vim.split(prompt, delimiter_2_spaces)

    if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
    end

    if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
    end

    return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
    }
end

local custom_multi_grep = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local make_entry = require("telescope.make_entry")
    local finders = require("telescope.finders")
    local finder = finders.new_async_job({
        command_generator = generate_rg_command,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    })

    local conf = require("telescope.config").values
    local pickers = require("telescope.pickers")
    pickers.new(opts, {
        prompt_title = "Multi Grep",
        finder = finder,
        debounce = 100,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty()
    }):find()
end

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
        --vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fg', custom_multi_grep)
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
