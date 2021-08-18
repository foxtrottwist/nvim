local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

cmd [[
	syntax enable
	colorscheme rigel
	set noshowmode
	set whichwrap+=<,>,h,l
	filetype plugin on
	filetype indent on
]]
-- Set to auto read when a file is changed from the outside
cmd [[
	set autoread
	au FocusGained,BufEnter * checktime
]]

-- Keep syntax highlighting in sync in larger React files
cmd [[
	autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
	autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
]]
-- Return to last edit position when opening files (You want this!)
cmd [[
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

g.mix_format_on_save = 1
g.rigel_airline = 1
g.airline_theme = 'rigel'
g.airline_powerline_fonts = 1
g.nvim_tree_width = 50
g.nvim_tree_auto_close = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1

opt.ai = true -- Auto indent
opt.backspace = {"eol", "start", "indent"} -- Configure backspace so it acts as it should act
opt.completeopt = {"menuone", "noselect"} -- Set completeopt to have a better completion experience
opt.cursorline = true
opt.expandtab = true -- Use spaces instead of tabs
opt.foldcolumn = "1" -- Setup code folding
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.hidden = true -- A buffer becomes hidden when it is abandoned
opt.history = 500 -- How many lines of history VIM has to remember
opt.hlsearch = true --  Highlight search results
opt.incsearch = true -- Makes search act like search in modern browsers
opt.ignorecase = true -- Ignore case when searching
opt.lazyredraw = true -- Don't redraw while executing macros (good performance config)
opt.magic = true -- For regular expressions turn magic on
opt.number = true -- Display relative line numbers, with absolute line number for current line
opt.numberwidth = 5
opt.mouse = "a" -- A little mourse never hurt anyone
opt.relativenumber = true
opt.si = true -- Smart indent
opt.smartcase = true -- When searching try to be smart about cases
opt.smarttab = true -- Be smart when using tabs ;)
opt.splitbelow = true -- Open new split panes below the current
opt.splitright = true -- Open new split panes to the right of current
opt.termguicolors = true -- Enable 24bit true color
opt.updatetime = 100 -- Delay before swap file is saved
opt.wrap = true -- Wrap lines
-- believe the following should work, but it does not https://github.com/neovim/neovim/pull/13479#event-4813249467
-- opt.whichwrap = opt.whichwrap + {"<", "" > "", "h", "l"}

-- Runs Formatter on save
vim.api.nvim_exec(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.tsx,*.css,*.scss,*.md,*.html : FormatWrite
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