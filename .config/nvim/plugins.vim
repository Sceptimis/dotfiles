" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug '/usr/bin/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'aurieh/discord.nvim'
    Plug 'mhinz/vim-startify'
    Plug 'zefei/vim-wintabs'
    Plug 'zefei/vim-wintabs-powerline'
    Plug 'tpope/vim-fugitive'
    Plug 'OmniSharp/omnisharp-vim'
call plug#end()

" omnisharp-vim
let g:OmniSharp_server_stdio = 1
