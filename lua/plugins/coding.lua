return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
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
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		lazy = false,
	},
}
