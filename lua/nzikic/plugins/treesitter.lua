return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        if jit and jit.os == "Windows" then
            local install = require("nvim-treesitter.install")
            install.compilers = { "cl", "zig", "clang", "gcc" }
        end

        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "cpp", "cmake", "bash", "vim", "vimdoc", "lua", "javascript" },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
