vim.opt.termguicolors = true
require("bufferline").setup({})

-- Keymap
local keymap = vim.keymap

keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin Current Buffer" })
keymap.set("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", { desc = "Delete Unpinned Buffers" })
