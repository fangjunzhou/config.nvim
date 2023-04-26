return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "clang-format",
      "marksman",
      "python-lsp-server",
      "texlab",
      "typescript-language-server",
    },
  },
  init = function()
    require("lspconfig").pylsp.setup({
      filetypes = {
        "python",
        "ipynb",
      },
    })
  end,
}
