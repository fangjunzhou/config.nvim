require("catppuccin").setup({
	flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
