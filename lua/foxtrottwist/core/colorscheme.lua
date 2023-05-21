require("catppuccin").setup({
	flavour = "macchiato",

	integrations = {
		cmp = true,
		-- barbar = true,
		fidget = true,
		harpoon = true,
		hop = true,
		lsp_saga = true,
		markdown = true,
		mason = true,
		-- noice = true,
		-- notify = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		which_key = true,
	},
})

-- set colorscheme with protected call in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
