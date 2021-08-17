lua require("init")

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Fast saving
nmap <leader>w :w!<cr>

" Map Esc to tn
inoremap tn <Esc>

" Turn terminal to normal mode with escape
tnoremap tn <C-\><C-n>

" Show list of Buffers
nnoremap <Leader>pp :Buffers<CR>

" Moving lines
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! CmdLine(str)
    call feedkeys(":" . a:str)
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

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" Elixir preferences
let g:mix_format_on_save = 1

" Keep syntax highlighting in sync in larger React files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"
" Airline preferences
" ---------------------
"
let g:rigel_airline = 1
let g:airline_theme = 'rigel'
let g:airline_powerline_fonts = 1

"
" BarBar preferences
" ---------------------
"
nnoremap <silent> <TAB> BufferNext<CR>
nnoremap <silent> <S-TAB> :BufferPrevious<CR>
nnoremap <silent> <Leader>bc :BufferClose<CR>
nnoremap <silent> <Leader>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Leader>bl :BufferOrderByLanguage<CR>

"
" Goyo preferences
" ---------------------
"
nnoremap <silent> <C-k> :Goyo<CR>

let g:goyo_width = 150

"
" Hop preferences
" ---------------------
"
nmap <silent> s :HopChar2<CR>
map <silent> S :HopWord<CR>
map <silent> <Leader>p :HopPattern<CR>
nmap <silent> <Leader>s :HopChar1<CR>
map <silent> <Leader>l :HopLine<CR>

"
" NVIM Tree preferences
" ---------------------
"
let g:nvim_tree_width = 35
let g:nvim_tree_auto_close = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1

nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"
" Telescope preferences
" ---------------------
"
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
