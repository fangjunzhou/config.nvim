require("notify").setup({
	stages = "fade",
})

-- Keymap
local map = vim.keymap.set

map("n", "<leader>un", function()
	require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Dismiss All Notifications" })
