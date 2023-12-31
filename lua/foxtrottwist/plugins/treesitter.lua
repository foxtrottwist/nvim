return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"bash",
					"css",
					"dockerfile",
					"elixir",
					"html",
					"gitignore",
					"go",
					"graphql",
					"json",
					"javascript",
					"lua",
					"markdown",
					"markdown_inline",
					"prisma",
					"regex",
					"svelte",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				require("ts_context_commentstring").setup({}),
				-- auto install above language parsers
				auto_install = true,
			})
		end,
	},
}
