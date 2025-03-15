--
-- Copilot Chat
local copilotchat = require('CopilotChat')
local copilotchat_select = require('CopilotChat.select')

vim.api.nvim_create_user_command(
    'CopilotChatVisual',
    function (args)
        copilotchat.ask(args.args, { selection = copilotchat_select.visual })
    end,
    { nargs = "*", range = true }
)

vim.api.nvim_create_user_command(
    'CopilotChatInline',
    function (args)
        copilotchat.ask(args.args, {
            selection = copilotchat_select.visual,
            window = {
                layout = "float",
                relative = "cursor",
                width = 1,
                height = 0.4,
                row = 1,
            }
        })
    end,
    { nargs = "*", range = true }
)

vim.api.nvim_create_user_command(
    'CopilotChatBuffer',
    function (args)
        copilotchat.ask(args.args, { selection = copilotchat_select.buffer })
    end,
    { nargs = "*", range = true }
)
