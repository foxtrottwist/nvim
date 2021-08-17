vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true
    }

    if opts then
        options = vim.tbl_extend('force', options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Fast saving
map("n", "<leader>w", ":w!<cr>")
-- Map Esc to tn
map("i", "tn", "<Esc>")
-- Map Control \ to tn for the integrated terminal
map("t", "tn", [[<C-\><C-n>]])
-- Show list of Buffers
-- map("n", "<Leader>pp", ":Buffers<CR>")
-- Moving lines
map("n", "<A-Down>", ":m .+1<CR>==")
map("n", "<A-up>", ":m .-2<CR>==")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-up>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("v", "<A-up>", ":m '<-2<CR>gv=gv")
-- Press Space to turn off highlighting and clear any message already displayed.
map("n", "<Space>", ":nohlsearch<Bar>:echo<CR>", {silent = true})
-- Focus
map("n", "<leader>j", ":FocusSplitLeft<CR>", { silent = true })
map("n", "<leader>e", ":FocusSplitDown<CR>", { silent = true })
map("n", "<leader>u", ":FocusSplitUp<CR>", { silent = true })
map("n", "<leader>i", ":FocusSplitRight<CR>", { silent = true })
-- BarBar
map("n", "<TAB>", "BufferNext<CR>", { silent = true })
map("n", "<S-TAB>", ":BufferPrevious<CR>", { silent = true })
map("n", "<Leader>bc", ":BufferClose<CR>", { silent = true })
map("n", "<Leader>bd", ":BufferOrderByDirectory<CR>", { silent = true })
map("n", "<Leader>bl", ":BufferOrderByLanguage<CR>", { silent = true })
-- Goyo
map("n", "<C-k>", ":Goyo<CR>", { silent = true })
-- Hop
map("n", "s", ":HopChar2<CR>", { silent = true })
map("n", "S", ":HopWord<CR>", { silent = true })
map("n", "<Leader>p", ":HopPattern<CR>", { silent = true })
map("n", "<Leader>s", ":HopChar1<CR>", { silent = true })
map("n", "<Leader>l", ":HopLine<CR>", { silent = true })
-- NVIM Tree 
map("n","<leader>t",":NvimTreeToggle<CR>")
map("n","<leader>rt",":NvimTreeRefresh<CR>")
map("n","<leader>ft",":NvimTreeFindFile<CR>")
-- Telescope preferences
map("n","<leader>ff","<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n","<leader>fg","<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n","<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>")
map("n","<leader>fh","<cmd>lua require('telescope.builtin').help_tags()<cr>")
