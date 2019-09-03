set nocompatible              " required
filetype off                  " required
set ignorecase
set hidden "switch buffers without saving
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
"call vundle#begin('~/some/path/here') " alternatively, top path to install plugins
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'othree/eregex.vim'
Plugin 'christoomey/vim-conflicted'
"Plugin 'scrooloose/syntastic' "sloooow
Plugin 'nvie/vim-flake8' "PEP8
Plugin 'w0rp/ale'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()  " All of your Plugins must be added before this line
filetype plugin indent on    " required


set autochdir
let python_highlight_all=1
syntax on

color peachpuff


let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

au BufNewFile,BufRead *.py
set autoindent
set fileformat=unix
set foldmethod=indent
set foldlevel=99
set expandtab
set clipboard=unnamed
set encoding=utf-8
set ruler
set tabstop=4
set softtabstop=4
set sw=4
set textwidth=79
set shiftwidth=4
set hlsearch
set paste
set laststatus=2

map <S-F> :set hlsearch! hlsearch?<CR>
map <C-f> * <CR>
map <C-o> :bd! <CR>
map <F12> :NERDTreeToggle<CR>
map <F5> :edit!<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <space> za " Enable folding with the spacebar
set pastetoggle=<F10>

"comment blocks with #
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
nnoremap <leader>/ :call eregex#toggle()<CR>

" speedup syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" always split windows vertically
set splitright
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  cabbrev split vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
else
  cabbrev hsplit hor split
endif

" shift tab
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >
vnoremap <S-Tab> <

" fix right mouse button over ssh+terminator
set mouse=
map <xCSI>[62~ <MouseDown>
set ttymouse=sgr

" youcomplete me optimozation plus space+g goes to def
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
