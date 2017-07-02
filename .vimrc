set nocompatible
filetype off

set encoding=utf-8

set noswapfile
set dir=/tmp/

set path+=**
set wildmenu
set showcmd

set cursorline
set background=dark
colorscheme solarized

if has('gui_running')

    if has("unix")
        set guifont=Source\ Code\ Pro\ for\ Powerline\ 13
    elseif has("gui_win32")
        set guifont=Sauce\ Code\ Powerline:h14
    elseif has("gui_macvim")
        set guifont=Sauce\ Code\ Powerline:h16
    endif
endif

" Disable mouse
set mouse=c

" Disable gui menu
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Auto indent
set autoindent
set smartindent
set cindent

" Set relative numbers
set nu
set relativenumber

" Incremental search highlight
set incsearch

" Warn when reaching 80 chars
match ErrorMsg '\%>80v.\+'
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Begin Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle handle Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
""Plugin 'xolox/vim-notes'
""Plugin 'xolox/vim-misc'
Plugin 'rust-lang/rust.vim'
Plugin 'bling/vim-bufferline'
Plugin 'cespare/vim-toml'
Plugin 'lambdatoast/elm.vim'

" End Vundle
call vundle#end()
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

syntax on

" Make 'jk' act as Esc
inoremap jk <esc>
vnoremap jk <esc> 
inoremap ht <esc>
vnoremap ht <esc> 

inoremap ( ()<esc>
inoremap ( ()<esc>
inoremap [ []<esc>
inoremap { {}<esc>
""inoremap ' ''<esc>
inoremap " ""<esc>

inoremap <tab> <C-p>
map <C-n> :!sh -xc './build' <cr><cr>

