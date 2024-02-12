local map = vim.keymap.set

map("n", "<leader>/", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live Grep" })

map("n", "<leader><space>", function()
	require("telescope.builtin").find_files()
end, { desc = "Find Files" })
