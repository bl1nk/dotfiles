" $HOME/.nvimrc
" bl1nk - http://kuchen.io

" bundles {{{

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'ajh17/VimCompletesMe'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'pearofducks/ansible-vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

" }}}
" settings {{{

set cc=80  " line at column 80
colo base16-solarized
set bg=dark

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
set lz              " don't redraw screen while running macros
set wrap            " softwrap lines
set cul             " highlight current line
if v:version > 704 || v:version == 704 && has("patch338")
    set bri " wraps paragraphs like sublime text
endif
set et ts=4 sw=4 ai
set wig+=*/tmp/*,*.so,*.swp,*.zip

" }}}
" maps {{{
" set leader to space

nnoremap <Space> <nop>
let mapleader=" "

nmap <leader>n   :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p   :set paste!<CR>
nmap <leader>w   :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l   :set list!<CR>
nmap <leader>]   :PymodeLint<CR>
nmap <leader>s   :w<CR>
nmap <ESC><ESC>  :noh<CR>

" exit insert mode with jj
imap jk <ESC>

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

" }}}
" bundle settings {{{

vmap <enter> <plug>(EasyAlign)

let g:ctrlp_map = '<c-p>'
nmap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:100'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

let g:airline_powerline_fonts = 0
let g:airline_theme = 'solarized'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'PASTE'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
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

let g:ansible_attribute_highlight = "ad"
let g:ansible_name_highlight = 'b'

" }}}
