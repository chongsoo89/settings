set encoding=utf-8
colors torte
syn on
set number
set ruler
set cursorline
set laststatus=2
set wildmenu
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set statusline=%<%F\ \ %h%m%r%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",Bomb\":\",NoBomb\").\"]\ \"}%k
set statusline+=%=
set statusline+=\ %-14.(Line:%l\/%L,Col:%c%V%)\ %P

set nobackup

set autochdir
set autoread

set ignorecase
set smartcase
set incsearch
"set hlsearch
set nowrapscan
set showmatch

set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab

let &makeprg = 'if [ -f Makefile ]; then make; else make -C ..; fi'
map <f5> :make<CR>
