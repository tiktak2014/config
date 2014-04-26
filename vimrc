" ========================================================
" neobundle
" ========================================================
if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomasr/molokai'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'klen/python-mode'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'godlygeek/csapprox'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you toinstall them.
NeoBundleCheck

" ========================================================
" basic configuration
" ========================================================
set nocompatible
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab

set hlsearch
set incsearch
set ignorecase

set nobackup
set noswapfile
set nowb

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set shortmess=atI  " 不要显示援助乌干达儿童的提示

set wildmenu
set lazyredraw
set showmatch
set matchtime=2
set scrolloff=5
set laststatus=2

" ========================================================
" more configuration
" ========================================================
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
autocmd BufRead,BufNewFile *.{go} set filetype=go
autocmd BufRead,BufNewFile *.{js} set filetype=javascript

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd * :call DeleteTrailingWS()

autocmd BufRead,BufNewFile *.py set colorcolumn=80

" ========================================================
" color scheme
" ========================================================
set background=dark
set t_Co=256
set number
set cursorline
colorscheme mymolokai

" ========================================================
" airline
" ========================================================
let g:airline_theme = "light"

" ========================================================
" nerdtree
" ========================================================
map <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$']
let NERDTreeShowHidden=1

" ========================================================
" tagbar
" ========================================================
map <F4> <ESC>:TagbarToggle<CR>

" ========================================================
" python-mode
" ========================================================
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_options = 1
let g:pymode_python = 'python'
"let g:pymode_indent = []
let g:pymode_folding = 0
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccache']

let g:pymode_rope = 1
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1

let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all
