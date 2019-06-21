" ================ Vundle ==================
set nocompatible " be iMproved, required
filetype off " required

" set default git protocal for vundle
" let g:vundle_default_git_proto = 'git'

" set the runtime path to include Vundle and initialize
if has('win32')
  set rtp+=~/vimfiles/bundle/Vundle.vim
  call vundle#begin('~/vimfiles/bundle/')
elseif has('unix')
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'sonph/onehalf', {'rtp': 'vim'}
Plugin 'elzr/vim-json' " for cluster

" All of yours Plugins must be added before the folloing line
call vundle#end() " required
filetype plugin indent on " required
" ==========================================

" settings for Vundle
nmap <Leader>nt <ESC>:NERDTree<CR>
set updatetime=100 " for gitgutter update
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always=1
endif
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter='unique_tail'
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
let g:vim_json_syntax_conceal=0

" set language and message
if has('win32')
  language message en
endif

" set UTF-8 encoding
set encoding=utf-8

" disable vi compatibility
set nocompatible

" turn syntax highlighting on
set t_Co=256
syntax on
colors onehalfdark
let g:airline_theme='onehalfdark'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" colors lucius
" colors Tomorrow-Night

" turn line numbers / ruler / cursorline on
set number
"set ruler
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

" display status line always
set laststatus=2

" turn wildmenu on
set wildmenu
set wildmode=list:longest,full

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
set nohlsearch
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

" Disable folding
set nofoldenable

" Mapping for Makefile
"let &makeprg = 'FILEMK=Makefile; PATHMK=./; DEPTH=1; while [ $DEPTH -lt 5 ]; do if [ -f $PATHMK$FILEMK ]; then make $* -C $PATHMK; break; else PATHMK=../$PATHMK; let DEPTH+=1; fi done'
"nmap <f5> :make mode=debug compiler=intel -j2<CR>
"nmap <S-f5> :make compiler=intel -j2<CR>
"nmap <f6> :make clean<CR>
"nmap <S-f6> :make distclean<CR>

" Function for CMake configure.
function! CMakeConfigure(type)
  call CMakeDistClean()
  exec 'cd' finddir("build", ';')
  if has('win32')
    exec "!cmake -G \"NMake Makefiles\" -D CMAKE_C_COMPILER=icl -D CMAKE_CXX_COMPILER=icl -D CMAKE_BUILD_TYPE=" . a:type . " .."
  else
    exec "!cmake -G \"Unix Makefiles\" -D CMAKE_C_COMPILER=icc -D CMAKE_CXX_COMPILER=icpc -D CMAKE_BUILD_TYPE=" . a:type . " .."
  endif
  exec 'cd' expand("%:p:h")
endfunction

" Function for CMake build.
function! CMakeBuild()
  exec 'cd' finddir("build", ';')
  if has('win32')
    compiler msvc
    make VERBOSE=1
  else
    make VERBOSE=1 -j2
  endif
  exec 'cd' expand("%:p:h")
endfunction

" Function for CMake clean.
function! CMakeClean()
  exec 'cd' finddir("build", ';')
  if has('win32')
    compiler msvc
    make clean VERBOSE=1
  else
    make clean VERBOSE=1
  endif
  exec 'cd' expand("%:p:h")
endfunction

" Function for CMake distclean.
function! CMakeDistClean()
  let bin_dir = finddir("bin", ';')
  let build_dir = finddir("build", ';')
  if has('win32')
    silent echo system("powershell -command \"remove-item " . bin_dir . "\\shaco.* -recurse -force\"")
    silent echo system("powershell -command \"remove-item " . build_dir . "\\* -exclude .gitignore -recurse -force\"")
  else
    silent echo system("rm -rf " . bin_dir . "/shaco")
    silent echo system("rm -rf " . build_dir . "/*")
  endif
  echom "distclean complete"
endfunction

" Mapping for CMake processes
nmap <f5> :call CMakeBuild()<CR>
nmap <f6> :call CMakeClean()<CR>
nmap <f7> :call CMakeConfigure("Debug")<CR>
nmap <f8> :call CMakeConfigure("Release")<CR>
nmap <f9> :call CMakeDistClean()<CR>

" Mapping for debugging
nmap <f4> :cn<CR>
nmap <f3> :cp<CR>

" Mapping for redrawing
nmap <f2> :redraw!<CR>

" Mapping for buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" Font for gvim
if has("gui_running")
  set guifont=D2Coding:h12
endif
