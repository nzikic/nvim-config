local M = {
  'CopilotC-Nvim/CopilotChat.nvim',
  opts = function ()
    return {
      model = 'claude-sonnet-4.5',
      mappings = {
        close = {
          normal = 'q',
          insert = ''
        },
      },
      system_prompt = [[
- You are expert coding assistant.
- Do things step by step and in small increments.
- Before answering always analyze the problem and the code thoroughly.
- When answering, always layout analysis and plan of action concisely and in steps.
- Do implementation only when explicitly asked.
]],
    }
  end,
  event = 'VeryLazy',
  keys = {
    { '<leader>at', '<cmd>CopilotChatToggle<CR>', desc = 'CopilotChat | Toggle chat' },
    { '<leader>as', '<cmd>CopilotChatStop<CR>',   desc = 'CopilotChat | Stop current output' },
    { '<leader>ap', '<cmd>CopilotChatPrompt<CR>', desc = 'CopilotChat | Prompt Actions' }
  }
}

return M
