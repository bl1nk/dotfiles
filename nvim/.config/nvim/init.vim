" $HOME/.nvimrc
" bl1nk - http://kuchen.io

" bundles {{{

call plug#begin()

Plug 'ajh17/VimCompletesMe'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'morhetz/gruvbox'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" }}}
" settings {{{

set cc=80  " line at column 80
colo gruvbox
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

nnoremap <Space> <nop>
let mapleader="\\"

nmap <leader>n   :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p   :set paste!<CR>
nmap <leader>w   :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l   :set list!<CR>
nmap <leader>s   :w<CR>
nmap <ESC><ESC>  :noh<CR>

" fzf
nmap <c-p> :Files .<CR>
nmap <c-b> :Buffers<CR>
nmap <c-l> :Lines<CR>

" exit insert mode with jk
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

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

let g:ansible_attribute_highlight = "ad"
let g:ansible_name_highlight = 'b'

" }}}

