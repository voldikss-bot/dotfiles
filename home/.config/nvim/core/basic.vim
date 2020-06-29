" ============================================================================
" FileName: basic.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" 基础设置
" file & directory & format
set history=2000
set pumheight=15
set updatetime=100
set autoread
set autowrite
set nobackup
set noswapfile
set nowritebackup
set undodir=$HOME/.cache/nvim/undo_dir/
set undofile
set isfname-==
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set nrformats=
set hidden
set nowrap
set fileignorecase
set formatoptions+=m
set formatoptions+=B
set dictionary+=~/.vim/dict/dictionary.txt
set nospell
set spellfile=~/.vim/spell/en.utf-8.add
set tags=./tags;,tags
set tagfunc=CocTagFunc
" key
set ttimeout
set timeoutlen=500
set ttimeoutlen=20
set mouse=a
set selectmode=mouse
set clipboard=unnamed
set backspace=2
set backspace=eol,start,indent
set whichwrap=b,s,<,>,[,]
set completeopt-=menu
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=longest   " Don't insert the longest common text
set completeopt-=preview   " Hide the documentation preview window
set completeopt+=noinsert  " Don't insert text automatically
set completeopt-=noselect  " Highlight the first completion automatically
set modeline
" style
set display=lastline
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
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
colorscheme molokai
" match & search
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
" tab & space & indent
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
" command window
set wildmode=longest,full
set wildmenu
set wildignorecase
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=__pycache__,.stversions,*.spl,*.out,%*
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
" neovim only
if matchstr(execute('silent version'), 'NVIM v\zs[^\n-]*') >= '0.4.0'
  set shada='20,<50,s10
  set inccommand=nosplit
  set wildoptions+=pum
  set signcolumn=yes:1
  set pumblend=10
endif
