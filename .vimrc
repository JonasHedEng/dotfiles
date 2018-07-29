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

if !has("$TMUX")
    """ Set cursor shapes: Normal-Block, Replace-Underscor, Insert-vBar
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif

syntax on

" Allow W for saves
ca W w

" Make 'jk' act as Esc
inoremap ht <esc>
vnoremap ht <esc> 

inoremap ( ()<esc>
inoremap ( ()<esc>
inoremap [ []<esc>
inoremap { {}<esc>
inoremap ' ''<esc>
inoremap " ""<esc>

inoremap <tab> <C-p>
" map <C-n> :!sh -xc './build' <cr><cr>

