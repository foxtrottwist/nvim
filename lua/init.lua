require("plugins")
require("plugins-setup")
require("options")
require("lsp-setup")

-- Map leader to comma
vim.g.mapleader = ","

-- Runs Formatter on save
vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.tsx,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
  augroup END
  ]], true)

