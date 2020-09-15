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
    Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }
call plug#end()

" omnisharp-vim
let g:OmniSharp_server_stdio = 1

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
   \ 'cpp': ['ccls'],
   \ 'c': ['ccls'],
   \ 'rust': ['rust-analyzer'],
   \ 'python': ['pyls'],
   \ }

let g:LanguageClient_autoStart = 1
