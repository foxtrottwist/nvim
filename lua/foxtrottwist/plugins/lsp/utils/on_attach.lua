return function(_, bufnr)
	-- A function to easily define mappings specific to LSP related items.
	-- It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
	end

	nmap("sr", "<cmd>Telescope lsp_references<CR>", "show definition references")
	nmap("gD", vim.lsp.buf.declaration, "go to declaration")
	nmap("gd", vim.lsp.buf.definition, "go to definition")
	nmap("gi", vim.lsp.buf.implementation, "go to implementation")
	nmap("<leader>ca", vim.lsp.buf.code_action, "see available code actions")
	nmap("<leader>rn", vim.lsp.buf.rename, "smart rename")
	nmap("K", vim.lsp.buf.hover, "show documentation for what is under cursor")
	nmap("<leader>sd", "<cmd>Telescope lsp_document_symbols<CR>", "Show current document symbols")
	nmap("<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Show workspace symbols")
end
