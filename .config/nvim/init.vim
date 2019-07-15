set nocompatible
syntax on
filetype plugin on

colorscheme happy_hacking

set encoding=utf-8

set number relativenumber
set tabstop=2
set shiftwidth=2

" splits open at the bottom and right:
set splitbelow splitright

" navigate between splits:
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

" copy selected text to system clipboard:
vnoremap <C-C> "+y
" paste from system clipboard:
map <C-p> "+P

" open url in firefox when pressing gx in normal mode:
let g:netrw_browsex_viewer = "firefox"
