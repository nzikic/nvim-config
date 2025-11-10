local M = {
  "CopilotC-Nvim/CopilotChat.nvim",
  version = "v4.7.4",
  opts = {
    model = "claude-sonnet-4.5",
    mappings = {
      close = {
        normal = 'q',
        insert = ''
      },
    },
  },
  event = "VeryLazy",
  keys = {
    { '<leader>at', '<cmd>CopilotChatToggle<CR>', desc = 'CopilotChat | Toggle chat' },
    { '<leader>as', '<cmd>CopilotChatStop<CR>', desc = 'CopilotChat | Stop current output' },
    { '<leader>ap', '<cmd>CopilotChatPrompt<CR>', desc = 'CopilotChat | Prompt Actions' }
  }
}

return M
