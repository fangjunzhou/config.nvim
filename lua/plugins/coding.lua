return {
	{
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
	},
	{
		"rafamadriz/friendly-snippets",
	},
	{
		"uga-rosa/cmp-dictionary",
		tag = "v2.2.0",
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	{
		"fangjunzhou/comment-divider.nvim",
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"m4xshen/autoclose.nvim",
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		lazy = false,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*",
		keys = {
			{
				"<leader>dd",
				mode = { "n" },
				function()
					require("neogen").generate({ type = "any" })
				end,
				desc = "Generate Matching Annotations",
			},
			{
				"<leader>df",
				mode = { "n" },
				function()
					require("neogen").generate({ type = "func" })
				end,
				desc = "Generate Function Annotations",
			},
			{
				"<leader>dF",
				mode = { "n" },
				function()
					require("neogen").generate({ type = "file" })
				end,
				desc = "Generate File Annotations",
			},
			{
				"<leader>dc",
				mode = { "n" },
				function()
					require("neogen").generate({ type = "class" })
				end,
				desc = "Generate Class Annotations",
			},
			{
				"<leader>dt",
				mode = { "n" },
				function()
					require("neogen").generate({ type = "type" })
				end,
				desc = "Generate Type Annotations",
			},
		},
	},
}
