if !empty(glob("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'ajh17/VimCompletesMe'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'nathanielc/vim-tickscript'
    Plug 'plasticboy/vim-markdown'

    Plug 'chriskempson/base16-vim'
    Plug 'owickstrom/vim-colors-paramount'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    "Plug 'airblade/vim-gitgutter'
    Plug 'nvie/vim-flake8'
    call plug#end()

    " color stuff
    if !empty($TMUX)
        set t_8b=[48;2;%lu;%lu;%lum
        set t_8f=[38;2;%lu;%lu;%lum
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
    colo base16-solarized-light
    "color paramount

    " fzf
    nmap <c-p> :Files .<CR>
    nmap <c-b> :Buffers<CR>
    nmap <c-l> :Lines<CR>

    " vim-markdown
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_toml_frontmatter = 1

    " vim-flake8
    "let g:flake8_show_in_gutter=0
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
nnoremap - <C-W>s<C-W><Down>
nnoremap <C-W><Bar> <C-W>v<C-W><Right>
nnoremap <C-W>- <C-W>s<C-W><Down>

" Enter distraction free writing mode with \d
nmap <leader>d :Goyo 80<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" pep8
let python_highlight_all = 1

