" It's Vim - not Vi
set nocompatible
filetype off
set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

Plugin 'corntrace/bufexplorer.git'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'mileszs/ack.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'groenewege/vim-less'
Plugin 'thoughtbot/vim-rspec.git'
Plugin 'benmills/vimux'
Plugin 'elixir-lang/vim-elixir'
Plugin 'suan/vim-instant-markdown'
Plugin 'chriskempson/base16-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'toyamarinyon/vim-swift'
" Plugin 'eraserhd/vim-ios'
Plugin 'mxw/vim-jsx'
Plugin 'vimwiki/vimwiki.git'
Plugin 'reedes/vim-pencil'

" Prevents some security exploits
set modelines=0

" default encoding
set encoding=utf-8

" enable per-directory .vimrc files
set exrc

" disable unsafe commands in local .vimrc files
set secure

try
  " persistent undo
  set undodir=~/.vim/undofiles
  set undofile
catch
  " Vim < 7.3
endtry

" No backups
set nobackup
set noswapfile

" Hide instad of closing - will not force writes
set hidden

" link unnamed register with the clipboard
if $TMUX == ''
  set clipboard+=unnamed
endif

" enable syntax highlighting
syntax enable

" use 2 spaces for tab
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set smarttab

" make backspace work in insert mode
set backspace=indent,eol,start

" no wrap long lines
set nowrap

" match indentation of previous line
set autoindent

" searching is case sensitive when all lowercase
set ignorecase smartcase

" highlight the search matches
set hlsearch

" show the first match as search strings are typed
set incsearch

" show line numbers
set number numberwidth=2

" Visual
set showmatch

" Show invisible characters
" set list
" Make them look like in TextMate
" set listchars=tab:▸\ ,eol:¬

" status line
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=[%c,%l] "cursor column
set statusline+=\ %P    "percent through file

" put useful info in status bar
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" colors
set background=dark
if $COLORTERM=='gnome-terminal'
  set term=gnome-256color
  " fix background color see:  http://sunaku.github.io/vim-256color-bce.html
  set t_ut=
end

colorscheme Tomorrow-Night

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" Setup font depending on the OS
if has('gui_macvim')
  set guifont=Monaco:h13
elseif has('gui_gnome')
  set guifont=Monospace\ 11
endif

" Hide toolbar
set guioptions-=T

" Show vertical line at 100th column
set colorcolumn=100

" Highlight current line and column
" hi CursorLine guibg=Gray20
" hi CursorColumn ctermbg=0 guibg=Gray20

" NETRW options
"  - vertical splitting for preview
let g:netrw_preview = 1
"  - "tree" listing style
let g:netrw_liststyle = 3
"  - dir listing width when preview is open
let g:netrw_winsize = 20
" netrw dir browse history
let g:netrw_dirhistmax = 100

" Ruby files
augroup ruby
  autocmd!
  autocmd BufNewFile,BufRead Gemfile,Rakefile,Guardfile,Vagrantfile  set filetype=ruby
augroup END

" Strip trailing whitespace for code files on save
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

augroup trailing_whitespace
  autocmd!
  autocmd FileType ruby,yaml,javascript,css,scss,haml,eco,coffee,python,yaml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
augroup END

" Enable spell check in git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" flip the default split directions to sane ones
set splitright
set splitbelow

" perform indentaion based on filetype plugin
filetype plugin indent on

" enable matchit plugin for better % support in ruby files
runtime macros/matchit.vim

" Key mappings
" dont use arrows!
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" buffer resizing
nnoremap <C-left> :vertical resize -2<cr>
nnoremap <C-right> :vertical resize +2<cr>
nnoremap <C-up> :resize -2<cr>
nnoremap <C-down> :resize +2<cr>

" unmap F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" make the search highlight disappear after \<space>
nnoremap <silent><Leader><space> :noh<cr>

" toggle cursor line and column
nnoremap <silent><Leader>c :set cursorline! cursorcolumn!<CR>

" NERDTree
nnoremap <silent><Leader>t :NERDTreeToggle<cr>
nnoremap <silent><Leader>f :NERDTreeFind<cr>

" xmpfilter (gem install rcodetools)
nmap <buffer> <F5> <Plug>(xmpfilter-run)
xmap <buffer> <F5> <Plug>(xmpfilter-run)
imap <buffer> <F5> <Plug>(xmpfilter-run)

nmap <buffer> <F4> <Plug>(xmpfilter-mark)
xmap <buffer> <F4> <Plug>(xmpfilter-mark)
imap <buffer> <F4> <Plug>(xmpfilter-mark)

" rspec.vim
let g:rspec_command = 'Dispatch bin/rspec {spec}'
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

let g:instant_markdown_slow = 1

" http://www.drbunsen.org/writing-in-vim/
func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set complete+=kspell
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! WP call WordProcessorMode()

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" https://superuser.com/a/907889
autocmd filetype crontab setlocal nobackup nowritebackup
