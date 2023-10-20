-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Autoformat
vim.g.autoformat = true

local opt = vim.opt

-- Setup treesitter code folding.
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Set the conceallevel.
opt.conceallevel = 0

-- Set wrap.
opt.wrap = true

-- Set formatoptions
opt.formatoptions = "jqlnt"
