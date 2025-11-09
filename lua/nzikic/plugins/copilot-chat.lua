return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        version = "v4.7.4",
        opts = {
--            question_header = "## User ",
--            answer_header = "## Copilot ",
--            error_header = "## Error ",
            model = "claude-sonnet-4.5",
            mappings = {
--                -- Use tab for completion
--                complete = {
--                    detail = "Use @<Tab> or /<Tab> for options.",
--                    insert = "<Tab>",
--                },
--                -- Close the chat
--                close = {
--                    normal = "q",
--                },
--                -- Reset the chat buffer
--                reset = {
--                    normal = "<C-x>",
--                    insert = "<C-x>",
--                },
--                -- Submit the prompt to Copilot
--                submit_prompt = {
--                    normal = "<CR>",
--                    insert = "<C-CR>",
--                },
--                -- Accept the diff
--                accept_diff = {
--                    normal = "<C-y>",
--                    insert = "<C-y>",
--                },
--                -- Show help
--                show_help = {
--                    normal = "g?",
--                },
            },
            prompts = {
                -- Code related prompts
                Explain = "Please explain how the following code works.",
                Review = "Please review the following code and provide suggestions for improvement.",
                Tests = "Please explain how the selected code works, then generate unit tests for it.",
                Refactor = "Please refactor the following code to improve its clarity and readability.",
                FixCode = "Please fix the following code to make it work as intended.",
                FixError = "Please explain the error in the following text and provide a solution.",
                BetterNamings = "Please provide better names for the following variables and functions.",
                Documentation = "Please provide documentation for the following code.",
                SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
                SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
                -- Text related prompts
                Summarize = "Please summarize the following text.",
                Spelling = "Please correct any grammar and spelling errors in the following text.",
                Wording = "Please improve the grammar and wording of the following text.",
                Concise = "Please rewrite the following text to make it more concise.",
            },
        },
        event = "VeryLazy",
        keys = {
            { '<leader>av', '<cmd>CopilotChatToggle<CR>', desc = 'CopilotChat | Toggle chat' },
            { '<leader>ae', '<cmd>CopilotChatExplain<CR>', desc = 'CopilotChat | Explain code' },
            { '<leader>af', '<cmd>CopilotChatFixError<CR>', desc = 'CopilotChat | Fix diagnostics' },
            { '<leader>at', '<cmd>CopilotChatTests<CR>', desc = 'CopilotChat | Write tests' },
            { '<leader>ar', '<cmd>CopilotChatReview<CR>', desc = 'CopilotChat | Review code' },
            { '<leader>aR', '<cmd>CopilotChatRefactor<CR>', desc = 'CopilotChat | Refactor code' },
            { '<leader>an', '<cmd>CopilotChatBetterNamings<CR>', desc = 'CopilotChat | Better naming' },
            {
                '<leader>ap',
                desc = 'CopilotChat | Prompt Actions',
                function ()
                    require('CopilotChat').select_prompt({ context = { 'buffers' } })
                end,
            },
--            {
--                '<leader>ap',
--                desc = 'CopilotChat | Prompt Actions',
--                mode = 'x',
--                function ()
--                    require('CopilotChat').select_prompt()
--                end,
--            },
            {
                '<leader>av',
                ':CopilotChatVisual ',
                desc = 'CopilotChat Visual | Open in vertical split',
                mode = 'x',
                function ()
                    require('CopilotChat').select_prompt()
                end,
            },
            {
                '<leader>al',
                ':CopilotChatInline ',
                desc = 'CopilotChat Visual | Inline chat',
                mode = 'x',
                function ()
                    require('CopilotChat').select_prompt()
                end,
            },
            {
                '<leader>ai',
                desc = 'CopilotChat - Ask input',
                function ()
                    local input = vim.fn.input('Ask Copilot: ')
                    if input ~= "" then
                        vim.cmd('CopilotChat ' .. input)
                    end
                end
            },
            {
                '<leader>aq',
                desc = 'CopilotChat | Quick chat',
                function ()
                    local input = vim.fn.input('Quick chat: ')
                    if input ~= "" then
                        vim.cmd('CopilotChatBuffer ' .. input)
                    end
                end,
            }
        },
    },
}
