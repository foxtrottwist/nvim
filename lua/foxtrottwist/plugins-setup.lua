-- auto install packer if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- set leader key to space
vim.g.mapleader = " "

-- add list of plugins to install
require("lazy").setup({
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	{ "catppuccin/nvim", name = "catppuccin" }, -- preferred colorscheme
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	"phaazon/hop.nvim", -- jump to positions in the visible editor area by entering a 2-character search pattern
	"theprimeagen/harpoon", -- mark files to navigate to and from quickly
	"mbbill/undotree", -- undo history
	-- commenting with gc
	"numToStr/Comment.nvim",
	-- file explorer
	"nvim-tree/nvim-tree.lua",
	-- vs-code like icons
	"kyazdani42/nvim-web-devicons",
	-- statusline
	"nvim-lualine/lualine.nvim",
	-- tabline
	{ "romgrk/barbar.nvim", dependencies = "nvim-web-devicons" },
	-- fuzzy finding w/ telescope
	{  "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x"  }, -- fuzzy finder

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
			"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			-- "folke/neodev.nvim",
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
		},
	},

	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"rafamadriz/friendly-snippets", -- useful snippets
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	"windwp/nvim-ts-autotag", -- autoclose tags
	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	-- zen mode
	{ "folke/zen-mode.nvim", dependencies = { "folke/twilight.nvim" } },

	-- messages, cmdline & popup
	{
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
})
