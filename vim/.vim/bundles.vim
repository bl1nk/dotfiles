" sort the bundles by plugin name with
"   sort i /\/\zs.\+\ze'/ r
Bundle 'rking/ag.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'w0ng/vim-hybrid'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'tpope/vim-surround'

" Bundle settings {{{
" hybrid {{{
	let g:hybrid_use_iTerm_colors = 1
	colorscheme hybrid
" }}}
"
" supertab {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}
"
" emmet {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}
"
" ctrlp {{{
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

nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>f :CtrlPCurWD<CR>
" }}}
"
" ag {{{
let g:aghighlight = 1
let g:ag_mapping_message = 0
nnoremap <leader>a :Ag!<space>
" }}}
"
" tabularize {{{
vmap <leader>t= :Tabularize /=<CR>
vmap <leader>t: :Tabularize /:\zs/l0l1<CR>
" }}}
" }}}

