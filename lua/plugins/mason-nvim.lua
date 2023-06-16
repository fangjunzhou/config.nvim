return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "clang-format",
      "cpptools",
      "marksman",
      "python-lsp-server",
      "rust_analyzer",
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
