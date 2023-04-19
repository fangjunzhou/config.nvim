return {
  dir = "~/documents/nvim-ext-projects/comment-divider.nvim/",
  dev = true,
  opts = {
    languageConfig = {
      cpp = {
        lineStart = "/*",
        lineSeperator = "-",
        lineEnd = "*/",
      },
      tex = {
        lineStart = "%",
        lineSeperator = "-",
        lineEnd = "%",
      },
    },
  },
}
