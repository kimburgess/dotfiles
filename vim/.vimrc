call plug#begin('~/,vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" enable syntax processing
syntax on

" tab spacing
set tabstop=2       " visual spaces per tab
set softtabstop=2   " number of spaces inserted with <TAB>
set expandtab       " converts tabs -> spaces

" better whitespace characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" indentation
set autoindent
set smartindent

" UI
set laststatus=2    " always show status line
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
inoremap jj <esc>

" NERDTree config
let NERDTreeMapAtivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

