if !empty(glob("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'ajh17/VimCompletesMe'
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

    Plug 'nathanielc/vim-tickscript'

    Plug 'chriskempson/base16-vim'
    Plug 'morhetz/gruvbox'
    call plug#end()

    " color stuff
    if has("termguicolors")
        set termguicolors
    else
        let g:gruvbox_termcolors=16
    endif
    colo base16-solarized-light

    " fzf
    nmap <c-p> :Files .<CR>
    nmap <c-b> :Buffers<CR>
    nmap <c-l> :Lines<CR>
endif

set cc=80      " line at column 80
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

nmap <leader>n   :setlocal nu!<CR>:setlocal rnu!<CR>
nmap <leader>p   :set paste!<CR>
nmap <leader>w   :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <leader>l   :set list!<CR>
nmap <ESC><ESC>  :noh<CR>

" exit insert mode with jk
imap jk <ESC>

" close help windows with q
augroup ft_help
    au!
    au FileType help nnoremap q :close<cr>
augroup END

" switch buffers with tab
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bN<cr>

" Use | and _ to split windows though the latter breaks jump-to-column
nnoremap <Bar> <C-W>v<C-W><Right>
nnoremap _ <C-W>s<C-W><Down>

