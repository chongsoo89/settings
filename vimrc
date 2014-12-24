:colorscheme torte
:set number
:set laststatus=2
:set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
:set nowrapscan

:set autochdir
:set autoread

:set ignorecase
:set smartcase
:set incsearch
:set hlsearch

:set tabstop=4
:set expandtab
:set shiftwidth=4
:set autoindent
:set cindent

:let &makeprg = 'if [ -f Makefile ]; then make; else make -C ..; fi'
:map <f5> :make<CR>
