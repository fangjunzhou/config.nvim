-- Set the leader key
vim.g.mapleader = " "

-- Keymap
local keymap = vim.keymap

-- Exit
keymap.set("n", "<Leader>q", "<cmd>q<CR>", { desc = "Quit Current Buffer" })
keymap.set("n", "<Leader>qq", "<cmd>qa<CR>", { desc = "Quit All" })

-- Disable search highlight
keymap.set("n", "<Leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Neotree
keymap.set("n", "<Leader>e", "<cmd>Neotree<CR>", { desc = "Open NeoTree" })

-- Lazy Git
keymap.set("n", "<Leader>gg", "<cmd>LazyGit<CR>", { desc = "Open Lazy Git" })
