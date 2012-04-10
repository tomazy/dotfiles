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
"set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]
set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=[%c,%l]     "cursor column
"set statusline+=%l/%L]   "cursor line/total lines
set statusline+=\ %P    "percent through file

" colors
set background=light
colorscheme solarized

" Setup font depending on the OS
if has('gui_macvim')
  set guifont=Monaco:h13
elseif has('gui_gnome')
  set guifont=Monospace\ 11
endif

" Hide toolbar
set guioptions-=T
" No backups
set nobackup
set noswapfile


" Highlight current line and column
hi CursorLine cterm=underline guibg=Gray20
hi CursorColumn ctermbg=0 guibg=Gray20
set cursorline
set cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" NETRW options
"  - vertical splitting for preview
let g:netrw_preview = 1
"  - "tree" listing style
let g:netrw_liststyle = 3
"  - dir listing width when preview is open
let g:netrw_winsize = 20
" netrw dir browse history
let g:netrw_dirhistmax = 100

" enable per-directory .vimrc files
set exrc
" disable unsafe commands in local .vimrc files
set secure

autocmd BufNewFile,BufRead Gemfile,Rakefile,Guardfile  set filetype=ruby

" Strip trailing whitespace for code files on save
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
autocmd FileType ruby,yaml,javascript,css,scss,haml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" dont use arrows!
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>
