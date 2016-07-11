" set UTF-8 encoding
set encoding=utf-8

" disable vi compatibility
set nocompatible

" turn syntax highlighting on
set t_Co=256
syn on
colors lucius
" colors Tomorrow-Night

" turn line numbers / ruler / cursorline on
set number
"set ruler
set cursorline

" display status line always
set laststatus=2

" turn wildmenu on
set wildmenu
set wildmode=list:longest,full

" intelligent comments
set statusline=%<%F\ \ %h%m%r%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",Bomb\":\",NoBomb\").\"]\ \"}%k
set statusline+=%=
set statusline+=\ %-14.(Line:%l\/%L,Col:%c%V%)\ %P

" turn backup file generation off
set nobackup

" set working directory to the current file
set autochdir

" automatically detecting changes on disk
set autoread

" searching option
set ignorecase
set smartcase
set incsearch
"set hlsearch
set nowrapscan

" highlight matching braces
set showmatch

" configure tabwidth and insert spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab

" use indentation of previous line
set autoindent

" Different settings for different file types.
filetype plugin indent on

" Enhanced keyboard mappings
" let &makeprg = 'if [ -f Makefile ]; then make $*; else make $* -C ..; fi'
let &makeprg = 'FILEMK=Makefile; PATHMK=./; DEPTH=1; while [ $DEPTH -lt 5 ]; do if [ -f $PATHMK$FILEMK ]; then make $* -C $PATHMK; break; else PATHMK=../$PATHMK; let DEPTH+=1; fi done'
map <f5> :make mode=debug<CR>
map <S-f5> :make<CR>
map <f6> :make clean<CR>
