local lsp_status_ignore_copilot = {
  'lsp_status',
  ignore_lsp = { 'copilot' },
}

local buffer_number = {
  function()
    return vim.api.nvim_get_current_buf()
  end,
  icon = '#'
}

local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'nightfly',
        --theme = 'tokyonight',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diagnostics', 'filename', buffer_number },
        lualine_c = {},
        lualine_x = { 'encoding', 'filetype', lsp_status_ignore_copilot },
        lualine_y = {},
        lualine_z = { 'selectioncount', 'progress', 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { 'filename', buffer_number },
        lualine_c = {},
        lualine_x = { 'progress', 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end
}

return M
