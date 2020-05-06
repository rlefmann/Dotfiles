let mapleader=","

" navigate between splits:
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" close a buffer and delete it from the buffer list:
nnoremap <C-w> :bdelete<CR>
" save the current buffer:
nnoremap <C-s> :w<CR>

" list open buffers:
nnoremap <leader>l :ls<CR>
" open a new tab for each buffer:
nnoremap <leader>t :tab sball<CR>
" open the file explorer in a new tab:
nnoremap <leader>o :tabedit . <CR>

" tab key will switch to the next tab
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>

" shortcuts for search and replace:
nnoremap <leader>s :%s//gc<Left><Left><Left>
nnoremap <leader>S :%s//g<Left><Left>

" use Ctrl+c and Ctrl+p for copy and paste:
vnoremap <C-c> y
map <C-p> P

" open nerdtree:
map <C-n> :NERDTreeToggle<CR>

" open goyo:
map <C-g> :Goyo<CR>
