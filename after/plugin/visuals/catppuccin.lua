require("catppuccin").setup({
	flavour = "macchiato",
	background = {
		light = "latte",
		dark = "macchiato",
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
