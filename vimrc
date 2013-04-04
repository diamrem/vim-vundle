set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim.git'
Bundle 'wincent/Command-T.git'
Bundle 'HenningM/cvim-pathogen.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX.git'
Bundle 'sontek/minibufexpl.vim.git'
Bundle 'vim-scripts/The-NERD-tree.git'
Bundle 'vim-scripts/pep8.git'
Bundle 'fs111/pydoc.vim.git'
Bundle 'mitechie/pyflakes-pathogen.git'
Bundle 'vim-scripts/Vim-R-plugin.git'
Bundle 'vim-scripts/Screen-vim---gnu-screentmux.git'
Bundle 'msanders/snipmate.vim.git'
Bundle 'ervandew/supertab.git'
Bundle 'vim-scripts/taglist.vim.git'
Bundle 'vim-scripts/TaskList.vim.git'
Bundle 'groenewege/vim-less.git'
Bundle 'mattn/zencoding-vim.git'
Bundle 'hallison/vim-markdown.git'
Bundle 'Rip-Rip/clang_complete'
Bundle 'cfddream/vim-mou'

" -----Key Mapping-----

" Control Window Movement
map <c-m> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Quickly call configuration
" \v brings up my .vimrc
" \V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" -----end Key Mapping-----

" ----- Moving Around/Editing -----
set cursorline " have a line indicate the cursor location
set ruler " show the cursor position all the time
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
"set nowrap " don't wrap text
autocmd Filetype python set textwidth=80
set linebreak " don't wrap textin the middle of a word
filetype plugin indent on " enable loading indent file for filetype
set autoindent " always set autoindenting on
set smartindent " use smart indent if there is no indent file
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4  
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
autocmd FileType python setl tabstop=4 shiftwidth=4 sts=4 "indentation for python file
autocmd FileType html setl ts=2 sw=2 sts=2 "indentation for html file
autocmd FileType js setl ts=2 sw=2 sts=2 "indentation for js file
autocmd FileType less setl ts=2 sw=2 sts=2 "indentation for less file
set matchpairs+=<:> " show matching <> (html mainly) as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default
" ----- end Moving Around/Editing -----


" -----Color Scheme-----
set t_Co=256
colorscheme solarized
" -----end Color Scheme-----


" -----Misc-----
set enc=utf-8
set fencs=utf-8,gbk,latin1
set hlsearch
set wildmenu
" set statusline=%=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%=[FORMAT=%{&ff}]\ [%Y]\ [ASCII=\%03.3b]\ [%04l,%04v][%p%%]\ [L%L]\ %t%h%m%r
" set statusline=%=[FORMAT=%{&ff}]\ [%Y]\ [ASCII=\%03.3b]\ [%04l,%04v][%p%%]\ [L%L]\ %F%m%r%h%w 
set laststatus=2
" syntax highlight
syntax on
" try to detect filetypes
filetype on
" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" register clipboard
if $TMUX == ''
    set clipboard+=unnamed
endif
" set clipboard=unnamed
" -----End Misc-----
