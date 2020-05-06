highlight CursorLine cterm=bold

" fix highlighting of cursor line after exiting Goyo:
augroup on_colorscheme
	autocmd!
	autocmd ColorScheme * set cursorline
	autocmd ColorScheme * highlight CursorLine cterm=bold
augroup END

" set background of tab bar to black:
hi TabLineFill ctermfg=Black ctermbg=Black
