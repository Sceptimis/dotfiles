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
    Plug 'lervag/vimtex'
call plug#end()

" omnisharp-vim
let g:OmniSharp_server_stdio = 1

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif
