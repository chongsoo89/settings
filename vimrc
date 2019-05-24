" ================ Vundle ==================
set nocompatible " be iMproved, required
filetype off " required

" set default git protocal for vundle
let g:vundle_default_git_proto = 'git'

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

" Function for finding folder.
function! FindFolder(name)
  let search_dir = fnameescape(expand("%:p:h"))
  for depth in [0, 1, 2]
    let build_dir = finddir(a:name, search_dir)
    if build_dir == ""
      let search_dir = fnamemodify(search_dir, ":h")
    endif
  endfor
  return build_dir
endfunction

" Function for CMake configure.
function! CMakeConfigure()
  call CMakeDistClean()
  let build_dir = FindFolder("build")
  exec 'cd' build_dir
  if has('win32')
    exec "!powershell -command \"cmake -G \\\"Visual Studio 15 2017 Win64\\\" -T \\\"Intel C++ Compiler 19.0\\\" ..\""
  else
    exec "!CC=icc CXX=icpc cmake -G \"Unix Makefiles\" -D CMAKE_BUILD_TYPE=Release .."
  endif
endfunction

" Function for CMake build.
function! CMakeBuild(type)
  let build_dir = FindFolder("build")
  exec 'cd' build_dir
  if has('win32')
    exec "!powershell -command \"cmake --build . --target ALL_BUILD --config " . a:type . "\""
  else
    " configure again to ensure build type.
    echom "wait ..."
    silent echo system("CC=icc CXX=icpc cmake -G \"Unix Makefiles\" -D CMAKE_BUILD_TYPE=" . a:type . " ..")
    let &makeprg="cmake --build . --target all -- -j2 VERBOSE=1"
    make
  endif
endfunction

" Function for CMake clean.
function! CMakeClean()
  let build_dir = FindFolder("build")
  exec 'cd' build_dir
  if has('win32')
    silent echo system("powershell -command \"remove-item *.dir -recurse -force\"")
  else
    silent echo system("rm -rf *.dir")
  endif
  echom "clean complete"
endfunction

" Function for CMake distclean.
function! CMakeDistClean()
  let build_dir = FindFolder("build")
  exec 'cd' build_dir
  if has('win32')
    silent echo system("powershell -command \"remove-item * -exclude .gitignore -recurse -force\"")
  else
    silent echo system("rm -rf *")
  endif
  let bin_dir = FindFolder("bin")
  exec 'cd' bin_dir
  if has('win32')
    silent echo system("powershell -command \"remove-item Debug -recurse -force\"")
    silent echo system("powershell -command \"remove-item Release -recurse -force\"")
  else
    silent echo system("rm -rf shaco")
  endif
  echom "distclean complete"
endfunction

" Mapping for CMake processes
nmap <f5> :call CMakeBuild("Debug")<CR>
nmap <S-f5> :call CMakeBuild("Release")<CR>
nmap <f6> :call CMakeClean()<CR>
nmap <S-f6> :call CMakeDistClean()<CR>
nmap <f7> :call CMakeConfigure()<CR>

" Mapping for debugging
nmap <f4> :cn<CR>
nmap <f3> :cp<CR>

" Mapping for buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" LatexSuite
"let Tex_FoldedSections=""
"let Tex_FoldedEnvironments=""
"let Tex_FoldedMisc=""
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_MultipleCompileFormats='pdf'
"let g:Tex_CompileRule_pdf = 'mkdir -p build && pdflatex -output-directory=build -interaction=nonstopmode $* && cp *.bib build && cd build && bibtex %:r && cd .. && pdflatex -output-directory=build -interaction=nonstopmode $* && pdflatex -output-directory=build -interaction=nonstopmode $* && mv build/$*.pdf .'
"let g:Tex_ViewRule_pdf='evince'
"if has('gui_running')
"  set grepprg=grep\ -nH\ $*
"  let g:tex_flavor='latex'
"  set gfn=Inconsolata\ Medium\ 15
"endif
