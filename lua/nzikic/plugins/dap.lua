local setup_dap_listeners = function(dap, dapui)
  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end

  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end

  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
end

local setup_dap_adapters = function(dap)
  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
  }
end

local setup_dap_keymaps = function()
  vim.keymap.set("n", "<leader>dt", ":lua require\"dapui\".toggle()<CR>")
  vim.keymap.set("n", "<leader>dr", ":lua require\"dapui\".toggle({ reset = true })<CR>")
  vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
  vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>")
end

local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
  },
  config = function()
    local dapui = require("dapui")
    dapui.setup()

    local dap = require("dap")
    setup_dap_listeners(dap, dapui)
    setup_dap_adapters(dap)
    setup_dap_keymaps()
  end
}

return M
