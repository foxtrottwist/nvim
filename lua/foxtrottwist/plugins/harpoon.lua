return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>e", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle Harpoon Menu" })

		keymap.set(
			"n",
			"<leader>am",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		keymap.set(
			"n",
			"<leader>an",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		keymap.set(
			"n",
			"<leader>at",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
	end,
}
