set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim.git'
Bundle 'wincent/Command-T.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/The-NERD-tree.git'
Bundle 'mitechie/pyflakes-pathogen.git'
Bundle 'vim-scripts/Vim-R-plugin.git'
Bundle 'vim-scripts/Screen-vim---gnu-screentmux.git'
Bundle 'Valloric/YouCompleteMe.git'
Bundle 'vim-scripts/TaskList.vim.git'
Bundle 'groenewege/vim-less.git'
Bundle 'hallison/vim-markdown.git'
Bundle 'duff/vim-bufonly'
Bundle 'vim-scripts/sudo.vim.git'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Bundle 'solarnz/thrift.vim'
" Bundle 'HenningM/cvim-pathogen.git'
" Bundle 'vim-scripts/taglist.vim.git'
" Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX.git'
" Bundle 'Conque-Shell'
" Bundle 'vim-scripts/Emmet.vim.git'
" Bundle 'vim-scripts/pep8.git'
" Bundle 'fs111/pydoc.vim.git'

filetype plugin indent on " enable loading indent file for filetype
set fileformat=unix

" -----Key Mapping-----

" remap leader key
" let mapleader = ","

" Control Window Movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" TaskList
map <leader>sk <Plug>TaskList

" Gundo Key 
nnoremap <leader>g :GundoToggle<CR>

" Pydoc
" map <leader>pw :Pydoc 
map <leader>pw :Pydoc <c-r>=expand("<cword>")<CR><CR>

" Nerdtree
map <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Taglist
nnoremap <silent> <F8> :TagbarToggle<CR>

" PEP8
" let g:pep8_map='<leader>8'

" Serching
nmap <leader>a <Esc>:Ack!

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Command T
map <leader>svt :vsplit<CR>:CommandT<CR>
map <leader>st :split<CR>:CommandT<CR>
map <leader>t :CommandT<CR>

" Quickly call configuration
" \v brings up my .vimrc
" \V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" -----end Key Mapping-----

" try to detect filetypes
filetype on
" ----- Moving Around/Editing -----
set cursorline " have a line indicate the cursor location
set ruler " show the cursor position all the time
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
"set nowrap " don't wrap text
" autocmd Filetype python set textwidth=80
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
set smartindent " use smart indent if there is no indent file
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4  
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
autocmd FileType python setl tabstop=4 shiftwidth=4 sts=4 "indentation for python file
autocmd FileType go setl tabstop=4 shiftwidth=4 sts=4 expandtab "indentation for go file
autocmd FileType html setl ts=2 sw=2 sts=2 "indentation for html file
autocmd FileType js setl ts=2 sw=2 sts=2 "indentation for js file
autocmd FileType less setl ts=2 sw=2 sts=2 "indentation for less file
autocmd FileType ruby setl ts=2 sw=2 sts=2 "indentation for ruby file
set matchpairs+=<:> " show matching <> (html mainly) as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default
" ----- end Moving Around/Editing -----


" -----Color Scheme-----
set t_Co=256
set background=dark
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
" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" register clipboard
if $TMUX == ''
    set clipboard+=unnamed
endif
" set clipboard=unnamed

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" -----End Misc-----

" -----Plugin Config-----
" Pyflakes
let g:pyflakes_use_quickfix = 0

" YCM config
let g:ycm_global_ycm_extra_conf = '/Users/kewu/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" Pydoc Preview
set completeopt=menuone,longest,preview

" R-plugin configuration
autocmd FileType r set fdm=indent
au BufNewFile,BufRead *.R set ft=r
let g:vimrplugin_underscore=0
let vimrplugin_tmux = 1
" let vimrplugin_r_path = "/opt/local/bin/"
let vimrplugin_r_path = "/usr/local/bin/"
let vimrplugin_applescript = 0
autocmd FileType r imap <c-_> <space><-<space>

" Ruby
let g:CommandTFileScanner="git"

" taglist configuration
" let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" map <C-/> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" tagbar
let g:tagbar_left = 1
" ------ Latex-Suite -------
" IMPORTANT: use helptags ~/.vim/bundle/latexsuite/doc/ to intial setup
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'

" -----End Plugin Config-----
