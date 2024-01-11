require("notify").setup({
  stages = "fade",
})

-- Keymap
local keymap = vim.keymap

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<leader>un", function ()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "" })
