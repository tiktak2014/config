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
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'klen/python-mode'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'fisadev/vim-isort'
NeoBundle 'evanmiller/nginx-vim-syntax'

NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'chriskempson/base16-vim'
"NeoBundle 'tomasr/molokai'

"NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()

" Required:
filetype on
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
set mouse=v
set magic

set wildmenu
set lazyredraw
set showmatch
set matchtime=2
set scrolloff=5
set laststatus=2
set backspace=2

" ========================================================
" more configuration
" ========================================================
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
autocmd BufRead,BufNewFile *.{go} set filetype=go
autocmd BufRead,BufNewFile *.{js} set filetype=javascript
autocmd BufRead,BufNewFile *.{html,xml} set ts=2 | set sw=2 | set sts=2

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

" 高亮显示第80行，vim7.3以上版本支持
autocmd BufRead,BufNewFile *.py,*.c,*.cc,*.cpp,*.h set colorcolumn=80 
autocmd BufRead,BufNewFile * set ts=4 | set sts=4 | set sw=4 | set expandtab
autocmd BufRead,BufNewFile *.html,*.xml set ts=2 | set sts=2 | set sw=2 | set expandtab

" 在被分割的窗口间显示空白
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=l
    set guioptions-=m
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Hermit\ Medium\ 10
    set ambiwidth=double
endif

" ========================================================
" color scheme
" ========================================================
set background=dark
set t_Co=256
set number
set cursorline
colorscheme base16-default

"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"let g:solarized_degrade=1
"colorscheme solarized

let g:CSApprox_hook_post = ['hi clear SignColumn']

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
let g:pymode_lint_checkers = ['pyflakes', 'pep8']

" ================  ============================
" Key               Command
" ================  ============================
" [[                Jump to previous class or function (normal, visual, operator modes)
" ]]                Jump to next class or function  (normal, visual, operator modes)
" [M                Jump to previous class or method (normal, visual, operator modes)
" ]M                Jump to next class or method (normal, visual, operator modes)
" aC                Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC                Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM                Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM                Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
" ================  ============================

let g:pymode_rope = 1
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutils', 'datetime']
let g:pymode_rope_autoimport_import_after_complete = 0

let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'new'

let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport_bind = '<C-c>ra'
" PymodeRopeModuleToPackage
let g:pymode_rope_module_to_package_bind = '<C-c>r1p'

let g:pymode_rope_extrack_method_bind = '<C-c>rm'
let g:pymode_rope_extrack_variable_bind = '<C-c>rl'
let g:pymode_rope_use_function_bind = '<C-c>ru'

let g:pymode_rope_move_bind = '<C-c>rv'
let g:pymode_rope_change_signature_bind = '<C-c>rs'

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

" ========================================================
" indentLine
" ========================================================
"let g:indentLine_loaded = 1
"let g:indentLine_enabled = 1
"let g:indentLine_fileType = ['python', 'c', 'cpp']

" ========================================================
" ctrlp
" ========================================================
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
set wildignore+=*.png,*jpg,*.gif
set wildignore+=*.avi,*.rmvb,*.wmv,*.rm

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

" ========================================================
" youcompleteme
" ========================================================
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<C-/>'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F9> :YcmCompleter GoToDefinitionElseDeclaration<CR>
