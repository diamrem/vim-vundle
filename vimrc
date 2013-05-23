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
" Bundle 'ervandew/supertab.git'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'vim-scripts/taglist.vim.git'
Bundle 'vim-scripts/TaskList.vim.git'
Bundle 'groenewege/vim-less.git'
Bundle 'mattn/zencoding-vim.git'
Bundle 'hallison/vim-markdown.git'
Bundle 'Rip-Rip/clang_complete'
Bundle 'cfddream/vim-mou'
Bundle 'duff/vim-bufonly'
Bundle 'vim-scripts/sudo.vim.git'

filetype plugin indent on " enable loading indent file for filetype

" -----Key Mapping-----

" remap leader key
let mapleader = ","

" Control Window Movement
map <c-m> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

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
nnoremap <silent> <F8> :TlistToggle<CR>

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

" -----Plugin Config-----
" Pyflakes
let g:pyflakes_use_quickfix = 0

" Supertab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

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

" taglist configuration
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" map <C-/> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" ------ Latex-Suite -------
" IMPORTANT: use helptags ~/.vim/bundle/latexsuite/doc/ to intial setup
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" ------Clang autocomplete config-----
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
" set pumheight=15
 
" SuperTab option for context aware completion
" let g:SuperTabDefaultCompletionType = "context"
 
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0

" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

let g:clang_library_path = '/opt/llvm/lib'

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" -----End Plugin Config-----
