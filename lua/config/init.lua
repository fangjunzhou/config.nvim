-- Config keymap
require("config.keymap")

-- Setup local variables
local opt = vim.opt

-- Indent settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Line numebr
opt.number = true
opt.relativenumber = true
-- Always enable signcolumn
opt.signcolumn = "yes"

-- Search case insensitive
opt.ic = true

-- System clipboard
opt.clipboard = "unnamedplus"
