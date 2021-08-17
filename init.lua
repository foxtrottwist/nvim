require("plugins")
require("plugins-setup")
require("options")
require("lsp-setup")
require("keymap")

-- Runs Formatter on save
vim.api.nvim_exec(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.tsx,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
  augroup END
  ]],
	true
)

-- Visual mode pressing * or # searches for the current selection
-- Super useful! From an idea by Michael Naumann
vim.cmd [[
  vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
  vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

  function! CmdLine(str)
      all feedkeys(":" . a:str)
  endfunction

  function! VisualSelection(direction, extra_filter) range
      let l:saved_reg = @"
      execute "normal! vgvy"

      let l:pattern = escape(@", "\\/.*'$^~[]")
      let l:pattern = substitute(l:pattern, "\n$", "", "")

      if a:direction == 'gv'
          call CmdLine("Ack '" . l:pattern . "' " )
      elseif a:direction == 'replace'
          call CmdLine("%s" . '/'. l:pattern . '/')
      endif

      let @/ = l:pattern
      let @" = l:saved_reg
  endfunction
]]