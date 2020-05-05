set nocompatible
syntax on
filetype plugin on
filetype indent off

set mouse=a

let mapleader=","

set ignorecase
set smartcase

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
	Plug 'scrooloose/nerdtree'
	Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

" hides buffers instead of closing them:
set hidden

set cursorline
highlight CursorLine cterm=bold

" fix highlighting of cursor line after exiting Goyo:
augroup on_colorscheme
	autocmd!
	autocmd ColorScheme * set cursorline
	autocmd ColorScheme * highlight CursorLine cterm=bold
augroup END

" set background of tab bar to black:
hi TabLineFill ctermfg=Black ctermbg=Black

set encoding=utf-8

set number
set tabstop=2
set shiftwidth=2

" splits open at the bottom and right:
set splitbelow splitright

" navigate between splits:
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" shortcuts for search and replace:
nnoremap <leader>s :%s//gc<Left><Left><Left>
nnoremap <leader>S :%s//g<Left><Left>


" Clipboard in Linux is a bit weird. Therefore this might not work on every
" system.
" Vim offers the '+' and '*' registers to reference the system clipboard.
" On Linux '+' corresponds to the desktop keyboard (Ctrl+C, Ctrl+V) and '*'
" corresponds to the X11 primary selection (paste using the middle mouse
" button)
" y and p will use the register '+', i.e. you can paste with Ctrl+V:
set clipboard+=unnamedplus
" If you want to use the '*' instead:
" set clipboard+=unnamed
"
" Alternatively, use Ctrl+C and Ctrl+P (Ctrl+V is for visual mode, so this
" cannot be used):
vnoremap <C-c> y
map <C-p> P

" Remove trailing whitespace on save:
autocmd BufWritePre * %s/\s\+$//e
" Remove trailing empty lines on save:
autocmd BufWritePre * %s/\($\n\s*\)\+\%$//e

" open nerdtree:
map <C-n> :NERDTreeToggle<CR>

" open goyo:
map <C-g> :Goyo<CR>
