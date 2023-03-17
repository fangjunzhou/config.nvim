return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local ensure_installed = opts.ensure_installed
      table.insert(ensure_installed, "cpp")
      opts.ensure_installed = ensure_installed
    end,
  },
}
