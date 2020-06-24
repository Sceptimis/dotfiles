let mapleader = ","

" Disable Arrow Keys in Normal, Visual, Select, and Operator Pending modes.
map <Up>    <NOP>
map <Down>  <NOP>
map <Left>  <NOP>
map <Right> <NOP>

" Disable Arrow Keys in Insert mode
imap <Up>    <NOP>
imap <Down>  <NOP>
imap <Left>  <NOP>
imap <Right> <NOP>

" Buffer navigation
nnoremap gb :ls<CR>:b<Space>

" Command Mode navigation with HJKL
cmap <C-h> <Left>
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-l> <Right>

" Esc in normal mode removes highlighting
nmap <Leader>n :noh<CR>

" Refresh File
nnoremap <Leader>r :e %<CR>

" Source File
nnoremap <Leader>S :source %<CR>

" Make Y behave like D
nnoremap Y y$
