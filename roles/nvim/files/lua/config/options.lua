-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- local opt = vim.opt
local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.hlsearch = false
opt.incsearch = true
opt.swapfile = false
opt.backup = false
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.colorcolumn = "100"
