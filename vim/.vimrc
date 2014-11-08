" $HOME/.vimrc
" bl1nk - http://kuchen.io

" bundles {{{
call plug#begin()
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'w0ng/vim-hybrid'
Plug 'airblade/vim-gitgutter'
call plug#end()
" }}}
" settings {{{
set colorcolumn=80  " line at column 80
set t_Co=256        " use 256 colors
let g:hybrid_use_Xresources=1
colo hybrid
set background=dark

set nu              " line numbers
set rnu             " relative line numbers
set fdm=marker      " fold at markers
set hid             " close modified buffers
set scs             " smart case when searching
set sm              " show matching brackets
set nobk            " no backup files
set nowb            " no backups before overwriting
set noswf           " no swap files
set dir=/tmp        " directory for tmp files
set tf              " fast redraw
set lz              " don't redraw screen while running macros
set wrap            " softwrap lines
if v:version > 704 || v:version == 704 && has("patch338")
    set breakindent " wraps paragraphs like sublime text
endif
" }}}
" maps {{{
nmap <leader>n   :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p   :set paste!<CR>
nmap <leader>w   :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l   :set list!<CR>
nmap <ESC><ESC>  :noh<CR>

" exit insert mode with jj
imap jj <ESC>

" switch between window splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" start/end of lines
nmap H ^
nmap L $

" close help windows with q
augroup ft_help
    au!
    au FileType help nnoremap q :close<cr>
augroup END

" toggle folds with space
nnoremap <Space> za
vnoremap <Space> za
" }}}
" bundle settings {{{
vmap <enter> <plug>(EasyAlign)

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:100'
nmap <c-b> :CtrlPBuffer<cr>


let g:airline_powerline_fonts = 0
let g:airline_theme = 'powerlineish'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_mode_map = {
			\ '__' : '-',
			\ 'n'  : 'N',
			\ 'i'  : 'I',
			\ 'R'  : 'R',
			\ 'c'  : 'C',
			\ 'v'  : 'V',
			\ 'V'  : 'V',
			\ '' : 'V',
			\ 's'  : 'S',
			\ 'S'  : 'S',
			\ '' : 'S',
			\ }
" }}}
