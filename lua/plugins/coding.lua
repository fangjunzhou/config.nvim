return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
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
			"saadparwaiz1/cmp_luasnip",
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
		lazy = false,
		keys = {
			{
				"<leader>hs",
				mode = { "n" },
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "Stage Hunk",
			},
			{
				"<leader>hr",
				mode = { "n" },
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "Reset Hunk",
			},
			{
				"<leader>hu",
				mode = { "n" },
				function()
					require("gitsigns").undo_stage_hunk()
				end,
				desc = "Undo Stage Hunk",
			},
		},
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
