require("plugins")
require("plugins-setup")
require("options")
require("lsp-setup")
require("keymap")


local api, cmd, g = vim.api, vim.cmd, vim.g

-- Runs Formatter on save
api.nvim_exec(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.tsx,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
  augroup END
  ]],
	true
)
