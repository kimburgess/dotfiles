call plug#begin('~/.vim/bundle')

" Files
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editor pimping
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'mtth/scratch.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fubitive'

" Syntax tools
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-surround'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'tpope/vim-sleuth'

" Lang
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'vim-crystal/vim-crystal'

" Text
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-colors-pencil'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="\<Space>"

set updatetime=100

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

" wrapping
set textwidth=80
autocmd Filetype markdown setlocal textwidth=0 wrap linebreak

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
let &colorcolumn=join(range(81,999),",")
let base16colorspace=256
let g:base16_shell_path='~/.config/base16-shell/scripts'
colorscheme base16-default-dark

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

" syntasic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='base16_default'

" Goyo set F5 to goyo
nmap <F5> :Goyo<cr>

" Nice markdown / text editing
function! Prose()
  call pencil#init()
  call lexical#init()
  call litecorrect#init()
  call textobj#quote#init()
  call textobj#sentence#init()

  " manual reformatting shortcuts
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6

  " replace typographical quotes (reedes/vim-textobj-quote)
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

  " spelling
  let g:lexical#spelllang = ['en_au']

  " colours
  set background=light
  colorscheme pencil

  Goyo
endfunction

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()
