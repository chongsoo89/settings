" ================ Vundle ==================
set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

" All of yours Plugins must be added before the folloing line
call vundle#end() " required
filetype plugin indent on " required
" ==========================================

" settings for Vundle
map <Leader>nt <ESC>:NERDTree<CR>
set updatetime=100
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

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

" Enhanced keyboard mappings
" let &makeprg = 'if [ -f Makefile ]; then make $*; else make $* -C ..; fi'
let &makeprg = 'FILEMK=Makefile; PATHMK=./; DEPTH=1; while [ $DEPTH -lt 5 ]; do if [ -f $PATHMK$FILEMK ]; then make $* -C $PATHMK; break; else PATHMK=../$PATHMK; let DEPTH+=1; fi done'
map <f5> :make mode=debug compiler=intel<CR>
map <S-f5> :make compiler=intel<CR>
map <f6> :make clean<CR>
map <S-f6> :make distclean<CR>

" LatexSuite
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p build && pdflatex -output-directory=build -interaction=nonstopmode $* && cp *.bib build && cd build && bibtex %:r && cd .. && pdflatex -output-directory=build -interaction=nonstopmode $* && pdflatex -output-directory=build -interaction=nonstopmode $* && mv build/$*.pdf .'
let g:Tex_ViewRule_pdf='evince'
"if has('gui_running')
"  set grepprg=grep\ -nH\ $*
"  let g:tex_flavor='latex'
"  set gfn=Inconsolata\ Medium\ 15
"endif
