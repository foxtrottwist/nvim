return {
	"elixir-tools/elixir-tools.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
