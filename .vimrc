runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

color zenburn
let g:zenburn_high_Contrast = 1

syntax on

set nowrap
set number
set expandtab
set tabstop=3
set shiftwidth=3

set showtabline=2

set showcmd

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

set visualbell t_vb=
set errorbells

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" disable Ex-Mode
nnoremap Q <nop>
