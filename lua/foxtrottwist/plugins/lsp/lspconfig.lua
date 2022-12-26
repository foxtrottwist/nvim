-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
	end

	nmap("gr", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
	nmap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- go to declaration
	nmap("gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
	nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
	nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
	nmap("<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
	nmap("<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
	nmap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
	nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
	nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
	nmap("K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
	nmap("<leader>o", "<cmd>Lspsaga outline<CR>") -- see outline on right hand side
	nmap("<leader>sd", "<cmd>Telescope lsp_document_symbols<CR>")
	nmap("<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		nmap("<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		nmap("<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
		nmap("<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},

	cssls = {},
	elixirls = {},
	html = {},
	sumneko_lua = {
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "require", "vim" },
			},
			workspace = {
				checkThirdParty = false,
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = { enable = false },
		},
	},
	tailwindcss = {},
	tsserver = {},
}

-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = vim.tbl_keys(servers), -- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_lspconfig.setup_handlers({
	function(server_name)
		if server_name == "typescript" then
			return
		end

		lspconfig[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
