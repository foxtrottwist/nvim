-- Use your favorite package manager to install, for example in lazy.nvim
--  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
return {
	{
		"sourcegraph/sg.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
		},
		opts = {
			-- enable_cody = true,
			-- on_attach = require("foxtrottwist.plugins.lsp.utils.on_attach"),
		},
	},
}
