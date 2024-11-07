vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.optsmartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

if jit and jit.os == "Windows" then
    vim.opt.undodir = os.getenv("LOCALAPPDATA") .. "\\nvim-data\\undodir"
else
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "
