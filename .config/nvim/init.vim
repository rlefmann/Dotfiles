filetype plugin on
filetype indent off

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/visuals.vim

" Remove trailing whitespace on save:
autocmd BufWritePre * %s/\s\+$//e
" Remove trailing empty lines on save:
autocmd BufWritePre * %s/\($\n\s*\)\+\%$//e
