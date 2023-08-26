return function(client, bufnr)
	-- A function to easily define mappings specific to LSP related items.
	-- It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
	end

	nmap("gr", "<cmd>Lspsaga lsp_finder<CR>", "show definition references")
	nmap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", "go to declaration")
	nmap("gd", "<cmd>Lspsaga peek_definition<CR>", "see definition and make edits in window")
	nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "go to implementation")
	nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "see available code actions")
	nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", "smart rename")
	nmap("<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", "show  diagnostics for line")
	nmap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "show diagnostics for cursor")
	nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to previous diagnostic in buffer")
	nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostic in buffer")
	nmap("K", "<cmd>Lspsaga hover_doc<CR>", "show documentation for what is under cursor")
	nmap("<leader>o", "<cmd>Lspsaga outline<CR>", "see outline on right hand side")
	nmap("<leader>sd", "<cmd>Telescope lsp_document_symbols<CR>")
	nmap("<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		nmap("<leader>rf", ":TypescriptRenameFile<CR>", "rename file and update imports")
		nmap("<leader>oi", ":TypescriptOrganizeImports<CR>", "organize imports")
		nmap("<leader>ru", ":TypescriptRemoveUnused<CR>", "remove unused variables")
	end
end
