local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  fallback_formatter = {
    formatters.lsp,
  },
})
