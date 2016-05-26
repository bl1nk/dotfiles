" $HOME/.config/nvim/init.vim
" bl1nk - http://kuchen.io

" bundles {{{

call plug#begin()

"Plug 'morhetz/gruvbox'
Plug 'ajh17/VimCompletesMe'
Plug 'chriskempson/base16-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'nathanielc/vim-tickscript'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" }}}
" settings {{{

set cc=80      " line at column 80
colo base16-solarized
set bg=dark

set nu         " line numbers
set rnu        " relative line numbers
set fdm=marker " fold at markers
set hid        " close modified buffers
set scs        " smart case when searching
set sm         " show matching brackets
set nobk       " no backup files
set nowb       " no backups before overwriting
set noswf      " no swap files
set dir=/tmp   " directory for tmp files
set lz         " don't redraw screen while running macros
set wrap       " softwrap lines
set cul        " highlight current line
set bri        " wraps paragraphs like sublime text
set et ts=4 sw=4 ai
set wig+=*/tmp/*,*.so,*.swp,*.zip

" }}}
" maps {{{

nnoremap <Space> <nop>
let mapleader="\<Space>"

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

