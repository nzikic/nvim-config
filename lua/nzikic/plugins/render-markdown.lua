return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'copilot-chat' },
  opts = {
    filetypes = { 'markdown', 'copilot-chat' },
    completions = { lsp = { enabled = true } }
  },
}
