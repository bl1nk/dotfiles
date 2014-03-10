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
Bundle 'ervandew/supertab'
Bundle 'jiangmiao/auto-pairs'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'nanotech/jellybeans.vim'
Bundle 'itchyny/lightline.vim'

" plugin settings {{{

let g:vim_markdown_folding_disabled = 1
let g:jellybeans_background_color_256 = 'none'
let g:SuperTabDefaultCompletionType = "context"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:ctrlp_map = '<leader>f'
let g:ctrlp_show_hidden = 1
" this is ignored since we're using ag
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]((\.(git|hg|svn))|build)$',
			\ 'file': '\v\.(DS_Store)$',
			\ }
let g:ctrlp_working_path_mode = 'ra'

if executable('ag')
	set grepprg=ag\ -nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor --ignore-dir .git -g ""'
	let g:ctrlp_use_caching = 0
endif

let g:aghighlight = 1
let g:ag_mapping_message = 0
nnoremap <leader>a :Ag!<space>

vmap <leader>t= :Tabularize /=<CR>
vmap <leader>t: :Tabularize /:\zs/l0l1<CR>

" }}}
" }}}
" general {{{

filetype plugin indent on
syntax enable
set ts=4 sts=4 sw=4 noexpandtab
set showbreak=+\ 
set laststatus=2
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
set nu
set rnu

set wildmenu
set wildmode=list:longest

set list
set listchars=tab:▸\ ,eol:¬,trail:·

colorscheme jellybeans
set background=dark
if has("gui_running")
	set guioptions=aegimLt
	set guifont=PragmataPro:h16
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

inoremap jj <ESC>

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
nmap <leader>; :CtrlPCurWD<CR>

vnoremap > >gv
vnoremap < <gv
inoremap <C-l> <ESC>A
noremap H ^
noremap L $


nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

cmap w!! %!sudo tee > /dev/null %

" }}}
" Source the vimrc file after saving it {{{

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" }}}

