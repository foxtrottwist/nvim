-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		keys = {
			edit = "<CR>",
		},
	},
	ui = {
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		winblend = 0,
		colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	},
})
