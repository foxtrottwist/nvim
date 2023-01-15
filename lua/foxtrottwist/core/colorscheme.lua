require("catppuccin").setup({
	flavour = "macchiato",

	integrations = {
		cmp = true,
		fidget = true,
		harpoon = true,
		hop = true,
		lsp_saga = true,
		markdown = true,
		mason = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
	},
})

-- set colorscheme with protected call in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
