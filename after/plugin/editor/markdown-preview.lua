-- Setup global variables
local g = vim.g

-- Disable auto close
g.mkdp_auto_close = 0

local map = vim.keymap.set

map("n", "<leader>mm", "<cmd>MarkdownPreview<cr>", { desc = "Strat Markdown Preview" })
map("n", "<leader>md", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop Markdown Preview" })
