filetype plugin indent on
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
set wildmode=list:longest

set list
set listchars=tab:▸\ ,eol:¬,trail:·
set showbreak=↪
set nu
set rnu

colorscheme jellybeans
set background=dark
if has("gui_running")
	set guioptions=aegimLt
	set guifont=Source\ Code\ Pro:h14
endif
set t_Co=256

" fix crontab editing
set backupskip=/tmp/*,/private/tmp/*

