" ================ Vundle ==================
set nocompatible " be iMproved, required
filetype off " required

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

" Option for windows
if has('win32')
  language message en
endif

" Mapping for Makefile
" let &makeprg = 'if [ -f Makefile ]; then make $*; else make $* -C ..; fi'
let &makeprg = 'FILEMK=Makefile; PATHMK=./; DEPTH=1; while [ $DEPTH -lt 5 ]; do if [ -f $PATHMK$FILEMK ]; then make $* -C $PATHMK; break; else PATHMK=../$PATHMK; let DEPTH+=1; fi done'
nmap <f5> :make mode=debug compiler=intel -j2<CR>
nmap <S-f5> :make compiler=intel -j2<CR>
nmap <f6> :make clean<CR>
nmap <S-f6> :make distclean<CR>
nmap <f4> :cn<CR>
nmap <f3> :cp<CR>

" Mapping for buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" LatexSuite
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p build && pdflatex -output-directory=build -interaction=nonstopmode $* && cp *.bib build && cd build && bibtex %:r && cd .. && pdflatex -output-directory=build -interaction=nonstopmode $* && pdflatex -output-directory=build -interaction=nonstopmode $* && mv build/$*.pdf .'
let g:Tex_ViewRule_pdf='evince'
"if has('gui_running')
"  set grepprg=grep\ -nH\ $*
"  let g:tex_flavor='latex'
"  set gfn=Inconsolata\ Medium\ 15
"endif
