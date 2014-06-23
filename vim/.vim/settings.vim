syntax enable

set ts=4 sts=4 sw=4 noexpandtab
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

set wildmenu
set wildmode=list:full
set laststatus=2

set list
set listchars=tab:▸\ ,eol:¬,trail:␣
set showbreak=↪
set nu
set rnu

if has("gui_running")
	set guioptions=aegimLt
	set guifont=PragmataPro:h16
endif
set t_Co=256

" fix crontab editing
set backupskip=/tmp/*,/private/tmp/*

" maps {{{

nmap <leader>n :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l :set list!<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

" exit insert mode with jj
inoremap jj <ESC>

" switch between window splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" toggle folds
nnoremap <Space> za
vnoremap <Space> za

" easy indentation
vnoremap > >gv
vnoremap < <gv

" start/end of lines
noremap H ^
noremap L $
inoremap <C-l> <ESC>A

" Markdown headings
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

" convert anything to a pdf
nnoremap <leader>P :!pandoc -s % -o %.pdf --smart<CR>

" fucking save it
cmap w!! %!sudo tee > /dev/null %

" }}}
