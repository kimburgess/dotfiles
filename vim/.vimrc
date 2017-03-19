call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'elzr/vim-json'
Plug 'raimondi/delimitmate'
Plug 'valloric/youcompleteme'
Plug 'altercation/vim-colors-solarized'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" enable syntax processing
syntax enable

" tab spacing
set tabstop=4       " visual spaces per tab
set softtabstop=4   " number of spaces inserted with <TAB>
set expandtab       " converts tabs -> spaces

" better whitespace characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" indentation
set autoindent
set shiftwidth=4

" UI
set laststatus=2    " always show status line
set nowrap          " disable line wraps
set number          " line numbers
set showcmd         " show last command in bottom bar
set showmatch       " bracket highlighting
set nospell         " spellcheck off
set visualbell      " die beep, die
set list            " show hidden characters
set background=dark
colorscheme solarized

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

" syntasic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
