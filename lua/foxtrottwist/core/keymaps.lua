local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set({ "n", "v", "i" }, "<C-z>", "<Nop>", { silent = true })

-- fast saving
keymap.set("n", "<leader>w", ":w!<CR>", { silent = true })

-- more intuitive redo
keymap.set({ "n", "v" }, "<S-U>", "<C-R>")

-- use tn to exit insert mode
keymap.set("i", "tn", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Moving lines
keymap.set({ "n", "v", "i" }, "<A-Down>", ":m .+1<CR>==", { silent = true })
keymap.set({ "n", "v", "i" }, "<A-up>", ":m .-2<CR>==", { silent = true })

-- keep cursor in the middle of the screen when using <C-d> & <C-u>
vim.keymap.set("n", "<C-f>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { silent = true }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { silent = true }) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { silent = true }) --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------
-- harpoon
keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu)

-- undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- zen-mode
keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true }) -- toggle file explorer
keymap.set("n", "<leader>fe", ":NvimTreeFocus<CR>", { silent = true }) -- focus file explorer

-- hop
keymap.set("n", "s", ":HopChar2<CR>", { silent = true })
keymap.set("n", "S", ":HopWord<CR>", { silent = true })

-- gitsigns
keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", { silent = true })
keymap.set("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", { silent = true })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap.set("n", "<leader>p", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" }) -- list open buffers in current neovim instance
keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

local opts = { noremap = true, silent = true }
-- Move to previous/next
keymap.set("n", "<S-TAB>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<TAB>", "<Cmd>BufferNext<CR>", opts)
-- Close buffer
keymap.set("n", "<A-x>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Sort automatically by...
keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
