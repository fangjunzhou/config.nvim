return {
  {
    "goerz/jupytext.vim",
    init = function()
      -- Setup jupytext.
      vim.g["jupytext_fmt"] = "py:percent"
    end
  },
}
