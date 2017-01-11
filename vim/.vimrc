set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/goyo.vim'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" enable syntax processing
syntax on

" tab spacing
set tabstop=2       " visual spaces per tab
set softtabstop=2   " number of spaces inserted with <TAB>
set expandtab 	    " converts tabs -> spaces

" indentation
set autoindent
set smartindent

" UI
set nowrap          " disable line wraps
set number          " line numbers
set showcmd         " show last command in bottom bar
set showmatch       " bracket highlighting
set spell           " spell checking
set visualbell      " die beep, die

" visual autocomplete for command menu
set wildmenu

" search
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
nnoremap <leader><space> :nohlsearch<CR>

" make leaving insert mode suck less
inoremap jk <esc>

" NERDTree config
let NERDTreeMapAtivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
