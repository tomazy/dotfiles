" see: http://nvie.com/posts/how-i-boosted-my-vim/
" see: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" It's Vim - not Vi
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" Prevents some security exploits
set modelines=0

set encoding=utf-8

" Hide instad of closing - will not force writes
set hidden

" enable syntax highlighting
syntax enable

" use 2 spaces for tab
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set smarttab

" make backspace work in insert mode
set backspace=indent,eol,start

" searching is case sensitive when all lowercase
set ignorecase smartcase

" highlight the search matches
set hlsearch

" make the search highlight disappear after \<space>
nnoremap <leader><space> :noh<cr>

" show the first match as search strings are typed
set incsearch

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

" status line
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
"set cursorline
"set cursorcolumn
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

" Ruby files
augroup ruby
  autocmd!
  autocmd BufNewFile,BufRead Gemfile,Rakefile,Guardfile  set filetype=ruby
augroup END

" Strip trailing whitespace for code files on save
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
augroup trailing_whitespace
  autocmd!
  autocmd FileType ruby,yaml,javascript,css,scss,haml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
augroup END

" dont use arrows!
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" flip the default split directions to sane ones
set splitright
set splitbelow

" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>

" link unnamed register with the clipboard
set clipboard=unnamed

" scroll the window when we get near the edge
set scrolloff=4 sidescrolloff=10

" no wrap long lines
set nowrap

" show line numbers
set number numberwidth=2

" match indentation of previous line
set autoindent

" perform indentaion based on filetype plugin
filetype plugin indent on
