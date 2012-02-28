call pathogen#infect()
filetype plugin indent on
set nocompatible

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

" No backups
set nobackup
set noswapfile
