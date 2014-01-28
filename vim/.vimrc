" $HOME/.vimrc
" bl1nk - http://kuchen.io

set nocompatible 
filetype off

" vundle {{{

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'nanotech/jellybeans.vim'
Bundle 'ervandew/supertab'
Bundle 'jiangmiao/auto-pairs'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'mattn/emmet-vim'
Bundle 'PotatoesMaster/i3-vim-syntax'

" plugin settings {{{

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_switch_buffer = 0
let g:vim_markdown_folding_disabled = 1
let g:jellybeans_background_color_256 = 'none'
let g:SuperTabDefaultCompletionType = "context"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" }}}
" }}}
" general {{{

filetype plugin indent on
syntax enable
set ts=4 sts=4 sw=4 noexpandtab
set showbreak=+\ 
set laststatus=1
set fdm=marker
set incsearch
set ignorecase
set smartcase
set hlsearch
set hidden
set showcmd
set showmode
set backspace=indent,eol,start
set scrolloff=3
set title
set visualbell
set shell=sh
set ofu=syntaxcomplete#Complete

set list
set listchars=tab:▸\ ,eol:¬

colorscheme jellybeans
set background=dark
if has("gui_running")
	set guioptions=aegimLt
	set guifont=Termsyn\ 12
endif
set t_Co=256

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=AL

" }}}
" keybinds {{{

nmap <leader>n :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l :set list!<CR>

nmap <leader>- :split<CR>
nmap <leader><bar> :vsplit<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <ESC><ESC> :nohlsearch<CR>

nnoremap j gj
nnoremap k gk
nnoremap <Space> za
vnoremap <Space> za

nmap ; :CtrlPBuffer<CR>

" }}}
" Source the vimrc file after saving it {{{

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" }}}
