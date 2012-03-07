" see: http://nvie.com/posts/how-i-boosted-my-vim/
" see: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" It's Vim - not Vi
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Detect file types
filetype plugin indent on

" Prevents some security exploits
set modelines=0

set encoding=utf-8

" Hide instad of closing - will not force writes
set hidden

syntax enable
set number
set autoindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start

set ignorecase
set smartcase
set hlsearch
set incsearch
" Make the search highlight disappear after \<space>
nnoremap <leader><space> :noh<cr>

try
  " persistent undo
  set undodir=~/.vim/undofiles
  set undofile
  set colorcolumn=85
catch
  " Vim < 7.3
endtry

" Visual
set showmatch
"?set mat=5
"set novisualbell  " No blinking
"set noerrorbells  " No noise

" Show invisible characters
set list
" Make them look like in TextMate
set listchars=tab:▸\ ,eol:¬

set laststatus=2
set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]

if has('gui')
  colorscheme railscasts
endif

set guifont=Monaco:h13
" Hide toolbar
set guioptions-=T
" No backups
set nobackup
set noswapfile
