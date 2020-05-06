" download and install vim-plug:
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'vimwiki/vimwiki'
	Plug 'junegunn/goyo.vim'
  "Plug 'scrooloose/nerdtree'
	Plug 'JuliaEditorSupport/julia-vim'
call plug#end()
