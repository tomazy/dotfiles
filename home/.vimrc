call pathogen#infect()
filetype plugin indent on
set nocompatible

" Add recently accessed projects menu (project plugin)
set viminfo^=!

syntax enable
set nu
set ignorecase
set nocp incsearch
set autoindent
set smarttab
set expandtab
set ts=2
set bs=2
set shiftwidth=2

" Visual
set showmatch
set mat=5
set novisualbell  " No blinking
set noerrorbells  " No noise


set laststatus=2
set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]
" colorscheme railscasts
set guifont=Monaco:h13

" Backups & Files
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.
