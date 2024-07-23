return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"smjonas/inc-rename.nvim",
			config = true,
		},
		{ -- Useful status updates for LSP
			"j-hui/fidget.nvim",
			opts = {
				window = {
					blend = 0,
				},
			},
			tag = "legacy",
		},
	},

	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local on_attach = require("foxtrottwist.plugins.lsp.utils.on_attach")

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		local elixir = require("elixir")
		local elixirls = require("elixir.elixirls")

		elixir.setup({
			capabilities = capabilities,
			-- nextls = { enable = true },
			credo = {},
			elixirls = {
				enable = true,
				settings = elixirls.settings({
					dialyzerEnabled = false,
					enableTestLenses = false,
				}),
				on_attach = on_attach,
			},
		})

		-- lspconfig["elixirls"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" },
		})

		lspconfig.gleam.setup({})

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				gopls = {
					gofumpt = true,
				},
				flags = {
					debounce_text_changes = 150,
				},
			},
		})

		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
		})

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["sourcekit"].setup({
			capabilities = capabilities,
			cmd = { "sourcekit-lsp" },
			on_attach = on_attach,
			filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"rustup",
				"run",
				"stable",
				"rust-analyzer",
			},
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
