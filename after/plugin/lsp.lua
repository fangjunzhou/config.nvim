require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      }
    }
  }
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go Declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Go References" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go Implementation" })
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add Workspace Folder" })
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "Remove Workspace Folder" })
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = "List Workspace Folder" })
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go Type Definition" })
    vim.keymap.set("n", "<space>rr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Action" })
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = "Format" })
  end,
})
