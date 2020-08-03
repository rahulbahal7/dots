
" set line numbers
set nu

set nocompatible

" Backspaces behave in an expected way.
set backspace=indent,eol,start

" Syntax Highlighting
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" search as chars are entered
set incsearch

" Speed up scrolling in Vim
set ttyfast

" Highlight matching search patterns
set hlsearch

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
