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

----------------------
-- Plugin Keybinds
----------------------

-- undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- zen-mode
keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- gitsigns
keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", { silent = true })
keymap.set("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", { silent = true })

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
