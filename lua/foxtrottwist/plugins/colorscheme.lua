return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			flavour = "macchiato",

			integrations = {
				alpha = true,
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

		vim.cmd([[colorscheme catppuccin]])
	end,
}
