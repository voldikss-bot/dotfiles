" vim:et sw=2 ts=2 fdm=marker fmr=[[[,]]]
" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

" file & directory & format [[[1
set history=2000
set pumheight=15
set updatetime=100
set autoread
set autowrite
set nobackup
set noswapfile
set nowritebackup
set undodir=~/.cache/nvim/undo_dir/
set undofile
set isfname-==
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set nrformats=
set hidden
set fileignorecase
set formatoptions+=m
set formatoptions+=B
set dictionary+=~/.vim/dict/dictionary.txt
set nospell
set spellfile=~/.vim/spell/en.utf-8.add
" key [[[1
set ttimeout
set timeoutlen=500
set ttimeoutlen=20
set mouse-=a
set selectmode=mouse
set clipboard=
set backspace=2
set backspace=eol,start,indent
set whichwrap=b,s,<,>,[,]
set completeopt-=preview
set modeline
" style [[[1
set termguicolors
set guicursor=
set pumheight=15
set title
set ruler
set cursorline
set laststatus=2
set showtabline=2
set guioptions-=e
set shortmess+=c
set shortmess-=S
set scrolloff=6
colorscheme molokai
" match & search [[[1
set showmatch
set matchtime=0
set matchpairs+=<:>
set matchpairs+=《:》
set matchpairs+=（:）
set matchpairs+=【:】
set matchpairs+=“:”
set matchpairs+=‘:’
set hlsearch
set incsearch
set ignorecase
set smartcase
" tab & space & indent [[[1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround
set relativenumber number
set foldlevel=99
set foldmethod=indent
set conceallevel=0
set autoindent
set smartindent
set cpoptions+=I
" command window [[[1
set wildmenu
set wildignorecase
set wildignore+=.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
set wildignore+=__pycache__,*.egg-info
