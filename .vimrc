syntax on
set nocompatible 
set number
set wildmenu
filetype off
set tabstop=4
set shiftwidth=4


" using system clipboard
set clipboard=unnamedplus


" mapleader
nnoremap <SPACE> <Nop>
let mapleader=" "


" set the runtime path to include Vundle and fzf
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf


" for plugin
call vundle#begin()
Plugin 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plugin 'junegunn/fzf.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'ParamagicDev/vim-medic_chalk'
Plugin 'nvie/vim-flake8'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'tibabit/vim-templates'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jremmen/vim-ripgrep'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'preservim/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prettier/vim-prettier' 

call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set shell=/bin/bash


" plugin vim-fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gd :Git diff HEAD<CR>
nnoremap <leader>gb :Git branch -a<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gh :diffget //2<CR>
" nnoremap <leader>gl :!git log --decorate --graph --oneline --all<CR>
nnoremap <leader>gl :Git log --decorate --graph --oneline --all<CR>


" vsplit
nnoremap <leader>v :vsplit<CR>
nnoremap ? :YcmCompleter GetDoc<CR>

" for fzf
nnoremap f :FZF<CR>
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'


" plugin YCM, Youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_auto_hover=""  " this guys is being default at April :))
let g:ycm_complete_in_comments = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,cuda,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'python' : ['re!\w{2}'],
  \ }
set completeopt-=preview
let g:EclimFileTypeValidate = 0
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_python_binary_path = 'python3'
let g:ycm_key_invoke_completion = '<C-n>'
let g:ycm_disable_for_files_larger_than_kb = 2000

nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

set termguicolors
colorscheme medic_chalk

" for sidebar
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_altv = 1
let g:netrw_winsize = 80
let g:netrw_browse_split = 2

" for markdown
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1

" for template
let g:tmpl_search_paths = ["~/.vim/templates"]


" for seamlessly navigate vim splits and tmux panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" if &term == "screen-256color"
"     let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" endif


augroup ProjectDrawer
  autocmd!
augroup END



" keep it always centered
" set so=999
noremap j jzz
noremap k kzz
noremap # #zz
noremap * *zz
noremap `` ``zz
noremap n nzz

xnoremap y y`]
xnoremap <C-y> "+y`]
xnoremap <C-p> "+P`]
nnoremap <C-p> "+P
nnoremap <C-c> gg"+yG``
inoremap jj <Esc>
if $TERM =~ 'xterm'
  set noek
endif

nnoremap <esc> :noh<Cr><esc>
nnoremap <esc>^[ <esc>^[


let g:NERDSpaceDelims = 1
set hlsearch
set incsearch
set linebreak

" for folded highlight
hi Folded ctermbg=Black
set foldmethod=indent
set foldlevel=10

" for vimdiff
hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta

autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:"
autocmd BufNewFile,BufRead Jenkinsfile setfiletype groovy

" ref: https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim
let &t_TI = ""
let &t_TE = ""

" for Nerdtree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
" set background=dark
" set term=screen-256color
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	  set termguicolors
  endif 

map <silent> <C-n> :NERDTreeToggle<CR>
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
set completeopt+=longest,menu
if has('patch-8.1.1902')
    set completeopt+=popup
    set completepopup=height:10,width:60,highlight:Pmenu,border:off
    set pumwidth=10
endif

pyx << EOF
import os.path
import sys
import vim
if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, "bin/activate_this.py")
	# execfile(activate_this, dict(__file__=activate_this))
    exec(compile(open(activate_this, "rb").read(), activate_this, "exec"), dict(__file__=activate_this))
EOF
