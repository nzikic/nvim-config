local M = {
  'CopilotC-Nvim/CopilotChat.nvim',
  version = 'v4.7.4',
  opts = function ()
    local predef_instructions = require('CopilotChat.config.prompts').COPILOT_INSTRUCTIONS.system_prompt
    local x = require('CopilotChat.config.prompts').Commit

    return {
      model = 'claude-sonnet-4.5',
      mappings = {
        close = {
          normal = 'q',
          insert = ''
        },
      },
      prompts = {
        coding_assistant = {
          system_prompt = predef_instructions .. 'Do things step by step and in small increments. Before answering always analyze the problem and code thoroughly. When answering, always layout analysis and plan of action concisely and in steps. Do implementation only when explicitly asked.',
          description = 'Coding assistant instructions',
        },
      },
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
