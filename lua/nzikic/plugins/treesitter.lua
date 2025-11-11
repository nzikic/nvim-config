return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    if vim.uv.os_uname().sysname == "Windows_NT" then
      local install = require("nvim-treesitter.install")
      install.compilers = { "cl", "zig", "clang", "gcc" }
    end

    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "cpp", "cmake", "bash", "vim", "vimdoc", "lua", "javascript" },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
