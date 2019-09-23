""Last update: 08.09.2017 22:20
"Settings
syntax on
set number
set autoread
set incsearch
set hlsearch
set termencoding=utf8
set ruler
set showcmd
" set mouse=a 
set mousehide
set autoindent
set nowrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

autocmd Filetype python setlocal ts=4 sw=4 ss=4 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab

set smartindent
set cursorline
set history=200
set wildmenu
"" New update from vim vk
set showmatch

" set nofoldenable
set foldmethod=indent
set foldminlines=20
set foldlevelstart=10

"for not hihglightings
set nohlsearch
syntax enable
:set noswapfile
set noshowmode
"""     Colorschemes  
"" in ~/.vim/colors/badwolf.vim
""colorscheme badwolf
""colorscheme OceanicNext
""colorscheme rupza
set background=dark
colorscheme solarized



""Close nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""Aliases
:imap qq <Esc>
:imap йй <Esc>
":command Я w
:command W w

map q <Nop>

nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[v`]
nnoremap ЯЯ wq
nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


"autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'shougo/echodoc.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"---------=== Code/project navigation ===-------------
Plug 'scrooloose/nerdtree'           " Project and file navigation
Plug 'majutsushi/tagbar'             " Class/module browser
"
""------------------=== Other ===----------------------
Plug 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plug 'rosenfeld/conque-term'          " Consoles as buffers
Plug 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
Plug 'garbas/vim-snipmate'       " Snippets manager
Plug 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plug 'tomtom/tlib_vim'       " dependencies #2
Plug 'honza/vim-snippets'        " snippets repo
"
""---------------=== Languages support ===-------------
" --- Python ---
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tmhedberg/SimpylFold' " python folding 
Plug 'sbdchd/neoformat' "autopep8
Plug 'tell-k/vim-autopep8'

Plug 'w0rp/ale'  " async

"" Turn on jedi
Plug 'davidhalter/jedi-vim'        " Jedi-vim autocomplete plugin
Plug 'zchee/deoplete-jedi'
Plug 'mgedmin/python-imports.vim'

" ----Ruby----
Plug 'vim-ruby/vim-ruby'

" --- finder---
Plug 'junegunn/fzf'
"" Best picker for neovim
Plug 'srstevenson/vim-picker'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }



call plug#end()


"" mdplugin settings
set conceallevel=2
let g:vim_markdown_autowrite = 1

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

let g:deoplete#enable_at_startup = 1

filetype on
filetype plugin on
filetype plugin indent on


" Dynamic environment identation
let pipenv_venv_path = system('pipenv --venv')
if v:shell_error == 0
  let g:venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:python3_host_prog = venv_path . '/bin/python'
else
  let g:venv_path = ''
  let g:python3_host_prog = '/usr/bin/python3'
endif


map <F2>    :ImportName<CR>
map <C-F2>  :ImportNameHere<CR>
map <expr> <F3>  ':!ctags -R ' . venv_path . ' --exclude={node_modules,static,env,staticfiles,data,db,client,target_files} . <CR>'
nnoremap tn :tabnew<bar> :NERDTreeToggle <CR>

map <F4> :!isort %<CR>

nnoremap tc :tabclose<CR>


" Moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"Vim tabs
nnoremap gt gT
nnoremap gy gt


""" Vim picker (fzy)
nmap <unique> <leader>pe <Plug>(PickerEdit)
nmap <unique> <leader>ps <Plug>(PickerSplit)
nmap <unique> <leader>pt <Plug>(PickerTabedit)
nmap <unique> <leader>pv <Plug>(PickerVsplit)
nmap <unique> <leader>pb <Plug>(PickerBuffer)
nmap <unique> <leader>p] <Plug>(PickerTag)
nmap <unique> <leader>pw <Plug>(PickerStag)
nmap <unique> <leader>po <Plug>(PickerBufferTag)
nmap <unique> <leader>ph <Plug>(PickerHelp)


"Nerd_commenter
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

 " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

 " Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

 " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'java': { 'left': '/**','right': '**/' }, 'py':{'left':'“””','right':'“”” ' } }

let NERDTreeIgnore = ['\.pyc$']

" Pymode 
let g:pymode_indent = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let g:pymode_warnings = 0

"" Debug pymode
" let g:pymode_debug = 1

" " проверка кода
let g:pymode_lint = 0
let g:pymode_lint_on_fly = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_lint_ignore = ["E501",]
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 0
" " провека кода после сохранения
let g:pymode_lint_write = 0


"" async lint ALE plugin
let g:ale_completion_enabled = 0

let b:ale_linters = ['pyflakes', 'mccabe']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'isort',
\   'ale#fixers#generic_python#BreakUpLongLines',
\   'yapf',
\]
let g:ale_fix_on_save = 0
nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_list_window_size = 5

"" async completion

let g:deoplete#complete_method = "omnifunc"
let g:deoplete#sources#jedi#python_path = 'python3'

" " поддержка virtualenv
let g:pymode_virtualenv = 1
let g:virtualenv_directory = $PWD
"
" " установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" let g:pymode_folding = 0
"
" Folding by tmhedberg
"
let g:SimpylFold_docstring_preview = 1

let g:pymode_run = 1
let g:pymode_run_bind = '<leader>e'
let g:pymode_python = 'python3'


"" PEP8 autocorrect
autocmd FileType python noremap <buffer> <F9> :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1
let g:autopep8_pep8_passes=120
let g:autopep8_max_line_length=100
let g:autopep8_aggressive=2


""JEDI
set omnifunc=jedi#completions
set completeopt=longest,menuone
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 2
let g:jedi#popup_on_dot = 0
let g:jedi#force_py_version=3
let g:jedi#completions_enabled = 1

" function! Tab_Or_Complete()
"       if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"             return "\<C-N>"
"       else
"             return "\<Tab>"
"       endif
" endfunction

" :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" :set dictionary="/home/timur/vim-words"

autocmd FileType python 

let g:echodoc_enable_at_startup = 1

set backspace=indent,eol,start


" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
:set guicursor=

if has('python')
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
endif

