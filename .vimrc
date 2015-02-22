runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

color zenburn
let g:zenburn_high_Contrast = 1

"color solarized
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1

syntax on

set nowrap
set number
set expandtab
set tabstop=3
set nobackup
set shiftwidth=3

set nocindent
set nosmartindent
set noautoindent
filetype indent off
filetype plugin indent off
filetype plugin on

set showtabline=2

set showcmd
set nobackup
" set nowritebackup
" set noswapfile

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

set visualbell t_vb=
set errorbells

set guifont=Droid\ Sans\ Mono\ Slashed

set omnifunc=syntaxcomplete#Complete
set ofu=syntaxcomplete#Complete

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
