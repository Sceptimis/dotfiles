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

" Buffer & Tab navigation
nnoremap gb :ls<CR>:b<Space>
nmap <C-h> <Plug>(wintabs_first)
nmap <C-j> <Plug>(wintabs_next)
nmap <C-k> <Plug>(wintabs_previous)
nmap <C-l> <Plug>(wintabs_last)
nmap <C-w><C-q> <Plug>(wintabs_close)
nmap <C-t><C-q> <Plug>(wintabs_close_vimtab)

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

" Fugitive Keybinds
augroup fugitive_commands
    autocmd!
    nnoremap <Leader>v :tab Gstatus<CR>
augroup END
