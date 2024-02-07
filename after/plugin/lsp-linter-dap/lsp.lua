require("mason").setup({
	PATH = "append",
})
require("mason-tool-installer").setup({
	ensure_installed = {
		-- ---------------------------------------------------------- --
		--                            LSP                             --
		-- ---------------------------------------------------------- --

		-- -------------------------- Lua  -------------------------- --
		"lua-language-server",
		-- ------------------------- C, C++ ------------------------- --
		"clangd",
		-- -------------------------- Web  -------------------------- --
		-- "gopls",
		-- "typescript-language-server",
		-- ----------------------- Documents  ----------------------- --
		"marksman",
		"ltex-ls",
		"texlab",
		-- ---------------------------------------------------------- --
		--                         Formatters                         --
		-- ---------------------------------------------------------- --
		"stylua",
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonToolsUpdate or :MasonToolsInstall.
	-- Default: false
	auto_update = true,

	-- automatically install / update on startup. If set to false nothing
	-- will happen on startup. You can use :MasonToolsInstall or
	-- :MasonToolsUpdate to install tools and check for updates.
	-- Default: true
	run_on_start = true,

	-- set a delay (in ms) before the installation starts. This is only
	-- effective if run_on_start is set to true.
	-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
	-- Default: 0
	start_delay = 0, -- 3 second delay

	-- Only attempt to install if 'debounce_hours' number of hours has
	-- elapsed since the last time Neovim was started. This stores a
	-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
	-- This is only relevant when you are using 'run_on_start'. It has no
	-- effect when running manually via ':MasonToolsInstall' etc....
	-- Default: nil
	debounce_hours = nil, -- at least 5 hours between attempts to install/update
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lspconfig.clangd.setup({})
lspconfig.gopls.setup({})
lspconfig.tsserver.setup({})
lspconfig.marksman.setup({})
lspconfig.ltex.setup({
	on_attach = function(client, bufnr)
		-- rest of your on_attach process.
		require("ltex_extra").setup({
			-- table <string> : languages for witch dictionaries will be loaded, e.g. { "es-AR", "en-US" }
			-- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
			load_langs = { "en-US" }, -- en-US as default
			-- boolean : whether to load dictionaries on startup
			init_check = true,
			-- string : relative or absolute path to store dictionaries
			-- e.g. subfolder in the project root or the current working directory: ".ltex"
			-- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
			path = ".ltex", -- project root or current working directory
			-- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
			log_level = "none",
			-- table : configurations of the ltex language server.
			-- Only if you are calling the server from ltex_extra
			server_opts = nil,
		})
	end,
	settings = {
		ltex = {
			checkFrequency = "edit",
			additionalRules = {
				enablePickyRules = true,
			},
			languageToolHttpServerUri = "https://languagetool.puffedpescado.com/",
		},
	},
})
lspconfig.texlab.setup({})
lspconfig.jdtls.setup({})
lspconfig.nil_ls.setup({})

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
		vim.keymap.set("n", "gr", function()
			require("telescope.builtin").lsp_references()
		end, { buffer = ev.buf, desc = "Go References" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go Implementation" })
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
		vim.keymap.set(
			"n",
			"<space>wa",
			vim.lsp.buf.add_workspace_folder,
			{ buffer = ev.buf, desc = "Add Workspace Folder" }
		)
		vim.keymap.set(
			"n",
			"<space>wr",
			vim.lsp.buf.remove_workspace_folder,
			{ buffer = ev.buf, desc = "Remove Workspace Folder" }
		)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = ev.buf, desc = "List Workspace Folder" })
		-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go Type Definition" })
		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Action" })
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = ev.buf, desc = "Format" })
	end,
})
