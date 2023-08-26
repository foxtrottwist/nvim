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

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- add list of plugins to install
require("lazy").setup({
	-- preferred colorscheme
	{ "catppuccin/nvim", name = "catppuccin" },
	-- add, delete, change surroundings (it's awesome)
	"tpope/vim-surround",
	"tpope/vim-repeat",
	-- replace with register contents using motion (gr + motion)
	"vim-scripts/ReplaceWithRegister",
	-- jump to positions in the visible editor area by entering a 2-character search pattern
	{ "phaazon/hop.nvim", opts = {} },
	-- mark files to navigate to and from quickly
	"theprimeagen/harpoon",
	-- undo history
	"mbbill/undotree",
	-- file explorer
	"nvim-tree/nvim-tree.lua",
	-- vs-code like icons
	"kyazdani42/nvim-web-devicons",
	-- source for text in buffer
	"hrsh7th/cmp-buffer",
	-- source for file system paths
	"hrsh7th/cmp-path",
	-- useful snippets
	"rafamadriz/friendly-snippets",
	-- enhanced lsp uis
	{ "glepnir/lspsaga.nvim", branch = "main" },
	-- additional functionality for typescript server (e.g. rename file & update imports)
	"jose-elias-alvarez/typescript.nvim",
	-- vs-code like icons for autocompletion
	"onsails/lspkind.nvim",
	-- configure formatters & linters
	"jose-elias-alvarez/null-ls.nvim",
	-- bridges gap b/w mason & null-ls
	"jayp0521/mason-null-ls.nvim",
	-- autoclose parens, brackets, quotes, etc...
	"windwp/nvim-autopairs",
	-- autoclose tags
	"windwp/nvim-ts-autotag",

	{ "goolord/alpha-nvim" },

	{ "stevearc/oil.nvim", opts = {} },

	{ -- zen mode
		"folke/zen-mode.nvim",
		dependencies = { "folke/twilight.nvim" },
		opts = {
			window = {
				width = 120,
			},

			plugins = {
				twilight = { enabled = true },
			},
		},
	},

	{ -- messages, cmdline & popup
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

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			--
			{ -- in charge of managing lsp servers, linters & formatters
				"williamboman/mason.nvim",
				build = ":MasonUpdate", -- :MasonUpdate updates registry contents
			},

			"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

			{ -- Useful status updates for LSP
				"j-hui/fidget.nvim",
				opts = {
					window = {
						blend = 0,
					},
				},
				tag = "legacy",
			},

			-- Additional lua configuration, makes nvim stuff amazing
			-- "folke/neodev.nvim",
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },

	{ -- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			-- signs = {
			-- 	add = { text = "+" },
			-- 	change = { text = "~" },
			-- 	delete = { text = "_" },
			-- 	topdelete = { text = "‾" },
			-- 	changedelete = { text = "~" },
			-- },
		},
	},

	{ -- statusline
		"nvim-lualine/lualine.nvim",
		opts = { options = { theme = "catppuccin" } },
	},

	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
		},
	},

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
})
