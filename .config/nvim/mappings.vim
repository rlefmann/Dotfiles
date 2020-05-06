let mapleader=","

" navigate between splits:
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

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
