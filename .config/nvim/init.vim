set nocompatible
syntax on
filetype plugin on

" Download and install vim-plug:
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" vim-plug plugins:
call plug#begin('~/.config/nvim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
call plug#end()


" hides buffers instead of closing them:
set hidden

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

" set vimwiki syntax to markdown:
let g:vimwiki_list = [{'path': '~/vimwiki/',
	\ 'syntax': 'markdown', 'ext': '.md'}]
