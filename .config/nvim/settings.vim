set nocompatible
syntax on
set encoding=utf-8
" enable mouse support:
set mouse=a
" search case insensitive if keyword starts with a lowercase letter:
set ignorecase
set smartcase
" hides buffers instead of closing them:
set hidden
" highlighting of the current line:
set cursorline
" line numbers
set number
" convert tabs to spaces:
set expandtab
" insert two spaces for a tab:
set tabstop=2
set shiftwidth=2
" splits are opened at the bottom and right:
set splitbelow splitright
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
" always show the tab bar:
set showtabline=2
