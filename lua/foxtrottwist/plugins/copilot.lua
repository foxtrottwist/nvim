return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true

		vim.keymap.set("i", "<C-Y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
		vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-line)")
		vim.keymap.set("i", "<C-W>", "<Plug>(copilot-accept-word)")
		vim.keymap.set("i", "<C-D>", "<Plug>(copilot-dismiss)")
		vim.keymap.set("i", "<C-N>", "<Plug>(copilot-next)")
	end,
}
