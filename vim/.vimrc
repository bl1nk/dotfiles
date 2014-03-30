" $HOME/.vimrc
" bl1nk - http://kuchen.io

set nocompatible 
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
source ~/.vim/bundles.vim

" everything in ~/.vim/plugin gets loaded automatically.
" that's awesome.

