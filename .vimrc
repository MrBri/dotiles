" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off                " Required for vundle
set shell=bash              " Make vim friendly with fishshell
set encoding=utf-8  " Set default encoding to UTF-8
set noswapfile
set nobackup                " Never let vim write a backup file, they did that in the 70's

set title           " change the terminals title
set hidden          " hide buffers instead of closing them
set history=1000    " rember ore commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildmenu                " Make the command-line completion better
set wildmode=list:longest
set clipboard=unnamed

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2  " Always show status line, required for Powerline

Bundle 'ctrlp.vim'
Bundle 'tComment'
Bundle 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['jscs', 'jshint']
Bundle 'nathanaelkane/vim-indent-guides'
" <Leader>ig
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'majutsushi/tagbar'

filetype plugin indent on         " required for vundle, allow plugins
" To ignore plugin indent changes, instead use: filetype plugin on

let mapleader = " "

set number  " Show line numbers
set numberwidth=3                 " Gutter
set ruler   " Show line and column number
" set ch=2    " Make command line two lines high

set pastetoggle=<F2>              " Toggle auto-indenting, etc when pasting

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set backspace=indent,eol,start    " backspace through everything in insert mode

set scrolloff=3

set incsearch
set hlsearch
set ignorecase
set smartcase
" Toggle search highlighting
map <Leader>h :set invhls <CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor  " Use Ag over Grep

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore "bower_components/" --ignore "node_modules/"'
  let g:ctrlp_use_caching = 0           " ag is fast enough that CtrlP doesn't need to cache
endif

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" set list                          " Show invisible characters
" set listchars=""                  " Reset the listchars
" set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
" set listchars+=trail:.            " show trailing spaces as dots
" set listchars+=extends:>          " The character to show in the last column when wrap is
"                                   " of the line continues beyond the right of the screen
" set listchars+=precedes:<         " The character to show in the last column when wrap is
"                                   " off and the line continues beyond the left of the screen

set ttyfast   " Send more characters fo redraws
if has('mouse')
  set mouse=a                     " Make mouse feel more natural, enable in all modes
endif
set ttymouse=xterm2   "Set to your terminal that supports mosue codes.

set splitbelow              " Open new split panes to right and bottom, which feels more natural
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
 
cmap w!! w !sudo tee % >/dev/null " lets you use w!! to sudo after opening a file

nmap <F8> :TagbarToggle<CR>