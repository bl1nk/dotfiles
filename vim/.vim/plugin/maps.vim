nmap <leader>n :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l :set list!<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk

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

" fucking save it
cmap w!! %!sudo tee > /dev/null %
