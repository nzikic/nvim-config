local M = {
  'fei6409/log-highlight.nvim',
  opts = {},
  config = function()
    require('log-highlight').setup { extension = { 'log', 'LOG' } }
  end
}

return M
