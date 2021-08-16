local cmd = vim.cmd
local opt = vim.opt

-- Enable the theme
cmd [[
	syntax enable"
	colorscheme rigel
	set noshowmode
	]]

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
opt.splitbelow = true -- Open new split panes to right and below
opt.splitright = true
opt.termguicolors = true -- Enable 24bit true color
opt.wrap = true -- Wrap lines

cmd "set whichwrap+=<,>,h,l"
-- believe the following should work, but it does not https://github.com/neovim/neovim/pull/13479#event-4813249467
-- opt.whichwrap = opt.whichwrap + {"<", "" > "", "h", "l"}

