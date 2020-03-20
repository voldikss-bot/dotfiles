" vim:et sw=2 ts=2 fdm=marker
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" Global Variables: {{{
" IndentCont:
let g:vim_indent_cont = 2
" BuiltinPlugin:
let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_man               = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1
let g:loaded_netrwPlugin       = 1
" HostProg:
if has('win32') || has('win64') || has('win32unix')
  let g:python3_host_prog='C:\Program Files\Python36/python.exe'
else
  let g:python3_host_prog='/usr/bin/python3'
endif
" NeoVimTerminalColors:
let g:terminal_color_0  = '#282828'
let g:terminal_color_1  = '#cc241d'
let g:terminal_color_2  = '#00ffff'
let g:terminal_color_3  = '#d79921'
let g:terminal_color_4  = '#458588'
let g:terminal_color_5  = '#b16286'
let g:terminal_color_6  = '#689d6a'
let g:terminal_color_7  = '#a89984'
let g:terminal_color_8  = '#928374'
let g:terminal_color_9  = '#fb4934'
let g:terminal_color_10 = '#00df5f'
let g:terminal_color_11 = '#fabd2f'
let g:terminal_color_12 = '#00afff'
let g:terminal_color_13 = '#d3869b'
let g:terminal_color_14 = '#8ec07c'
let g:terminal_color_15 = '#ebdbb2'
" }}}

" Basic: {{{
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
set mouse-=a
set selectmode=mouse
set clipboard=
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
set foldmethod=manual
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
  set signcolumn=yes:2
  set pumblend=10
endif
" }}}

" Plugin: {{{
call plug#begin('~/.cache/plugged')
" Languages
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': 'cd app && yarn install'}
Plug 'alvan/vim-closetag', {'for': ['html', 'xml']}
Plug 'numirias/semshi', {'for': 'python'}
Plug 'posva/vim-vue', {'for': 'vue'}
" Completion
Plug 'neoclide/coc.nvim'
" Style
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify', {'on': 'Startify'}
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'kshenoy/vim-signature'
Plug 'guns/xterm-color-table.vim', {'on': 'XtermColorTable'}
" Git
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim', {'on': 'GitMessenger'}
" Others
" Plug 'brglng/vim-im-select'
" Plug 'puremourning/vimspector'
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop'] }
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/vim-dict'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'voldikss/vim-browser-search'
Plug 'voldikss/vim-codelf'
Plug 'voldikss/vim-translator'
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/vim-hello-word'
Plug 'voldikss/vim-fnote'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'lfv89/vim-interestingwords'
Plug 'liuchengxu/vista.vim'
Plug 'tommcdo/vim-exchange'
Plug 'matze/vim-move'
Plug 'andrewradev/sideways.vim', {'on': ['SidewaysLeft', 'SidewaysRight']}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'foosoft/vim-argwrap', {'on': 'ArgWrap'}
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vader.vim'
Plug 'wellle/targets.vim'
Plug 'yianwillis/vimcdoc'
call plug#end()
" }}}

" Autocmds: {{{
augroup ParenColor
  autocmd!
  autocmd VimEnter,BufWinEnter *
    \ if index(['html', 'htmldjango', 'tex', 'mma', 'vue'], &filetype) < 0 |
      \ syntax match paren1 /[{}]/   | hi paren1 guifg=#FF00FF |
      \ syntax match paren2 /[()]/   | hi paren2 guifg=#DF8700 |
      \ syntax match paren3 /[<>]/   | hi paren3 guifg=#0087FF |
      \ syntax match paren4 /[\[\]]/ | hi paren4 guifg=#00FF5F |
    \ endif
augroup END

augroup LocalKayMap
  autocmd!
  autocmd BufEnter * if &buftype=='terminal' | nmap <buffer><silent>q :q<CR> | endif
augroup END

augroup FileTypeAutocmds
  autocmd!
  autocmd FileType startify nmap <buffer> l <CR>
  autocmd FileType floaterm setlocal cursorline
  autocmd FileType help setlocal number
  autocmd FileType * set formatoptions-=cro
augroup END

augroup UserAutoSaveBuffer
  autocmd!
  autocmd FocusLost,InsertLeave * call userfunc#format#AutoSave()
augroup END

augroup UserLineNumber
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

augroup UserEqualWindowSize
  autocmd!
  autocmd VimResized * exec "normal \<C-w>="
augroup END

augroup UserJumpToLastPosition
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g'\"" |
    \ endif
augroup END

augroup UserKeywordHighlight
  autocmd!
  autocmd Syntax *
    \ call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)') |
    \ call matchadd('Todo',  '\W\zs\(NOTE\|Note\|INFO\|IDEA\|NOTICE\)') |
    \ call matchadd('Debug', '\W\zs\(Debug\|DEBUG\)') |
augroup END

augroup UserAutoChangeDir
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

augroup UserAutoAddGitignore
  autocmd!
  autocmd BufNewFile .gitignore CocCommand template.templateTop
augroup END

augroup UserChecktime
  autocmd!
  autocmd FocusGained * checktime
augroup END

if has('nvim')
augroup UserTermSettings " neovim only
  autocmd!
  autocmd TermOpen *
    \ setlocal signcolumn=no |
    \ setlocal nobuflisted |
    \ setlocal nospell |
    \ nmap <silent><buffer> <Esc> <Cmd>hide<CR>|
    \ hi TermCursor guifg=yellow
augroup END
endif

" }}}

" Abbrevs: {{{
function! s:SetCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call s:SetCommandAbbrs('ar', 'AsyncRun')
call s:SetCommandAbbrs('as', 'AsyncStop')
call s:SetCommandAbbrs('at', 'AsyncTask')
call s:SetCommandAbbrs('ca', 'CocAction')
call s:SetCommandAbbrs('cc', 'CocConfig')
call s:SetCommandAbbrs('cf', 'CocFix')
call s:SetCommandAbbrs('ci', 'CocInstall')
call s:SetCommandAbbrs('cl', 'CocList')
call s:SetCommandAbbrs('cm', 'CocCommand')
call s:SetCommandAbbrs('cr', 'CocRestart')
call s:SetCommandAbbrs('cs', 'CocSearch')
call s:SetCommandAbbrs('cu', 'CocUninstall')
call s:SetCommandAbbrs('gap', 'Git add -p')
call s:SetCommandAbbrs('gc', 'Gcommit -v')
call s:SetCommandAbbrs('gca', 'Gcommit --amend -v')
call s:SetCommandAbbrs('gco', 'AsyncRun git checkout .')
call s:SetCommandAbbrs('gd', 'Gvdiff')
call s:SetCommandAbbrs('gl', 'Git lg')
call s:SetCommandAbbrs('gpull', 'AsyncRun git pull')
call s:SetCommandAbbrs('gpush', 'AsyncRun git push')
call s:SetCommandAbbrs('gs', 'Gstatus')
call s:SetCommandAbbrs('gw', 'Gw')
call s:SetCommandAbbrs('pc', 'PlugClean')
call s:SetCommandAbbrs('pi', 'PlugInstall')
call s:SetCommandAbbrs('pu', 'PlugUpdate')
call s:SetCommandAbbrs('sl', 'CocCommand session.load default')
call s:SetCommandAbbrs('ss', 'CocCommand session.save default')
call s:SetCommandAbbrs('st', 'Startify')
call s:SetCommandAbbrs('sw', 'SwitchWindow')
call s:SetCommandAbbrs('tm', 'TabMessage')
call s:SetCommandAbbrs('w!!', '%!sudo tee >/dev/null %')
" }}}

" Commands: {{{
command! -nargs=0 OpenFileExplorer call userfunc#utils#OpenFileExplorer()
command! -nargs=0 AutoFormat call userfunc#format#AutoFormat()
command! -nargs=+ Grep  call userfunc#utils#Grep(<q-args>)
command! -nargs=* SyntaxAt call userfunc#utils#SyntaxAt(<f-args>)
command! -nargs=+ -complete=file  BrowserOpen  call userfunc#utils#BrowserOpen(<q-args>)
command! -nargs=+ -complete=command  TabMessage call userfunc#utils#TabMessage(<q-args>)
command! -nargs=? -complete=customlist,userfunc#quickrun#Complete QuickRun call userfunc#quickrun#Run(<f-args>)
command! -nargs=+ -complete=customlist,userfunc#window#Complete SwitchWindow call userfunc#window#SwitchWindow(<q-args>)
command! -nargs=? Line call userfunc#utils#DelimiterLine('light', <f-args>)
command! -nargs=? Bline call userfunc#utils#DelimiterLine('bold', <f-args>)
command! -nargs=? Cline call userfunc#utils#DelimiterLine('comment', <f-args>)
" }}}

" Mappings: {{{
let mapleader   = ';'
let g:mapleader = ';'
noremap  H  ^
noremap  L  $
" Esc:
inoremap <C-c> <C-R>=userfunc#keymap#Insert_ESC()<CR>
inoremap <C-[> <C-R>=userfunc#keymap#Insert_ESC()<CR>
inoremap <Esc> <C-r>=userfunc#keymap#Insert_ESC()<CR>
"cannot use noremap
nmap     M  %
omap     M  %
xmap     M  %
noremap  U  <C-R>
noremap  '  `
vnoremap <  <gv
vnoremap >  >gv
noremap <C-U> kkkkkkkkkkkkkkkkkkkkk
noremap <C-D> jjjjjjjjjjjjjjjjjjjjj
" Jump:
noremap <silent> <C-j>      <C-]>
noremap <silent> <C-W><C-j> <C-W><C-]>
noremap <silent> <C-k>      :<C-u>call userfunc#utils#ShowDocument()<CR>
" Search:
" use set shortmess-=S to display searchindex
nnoremap <silent> n  nzz
nnoremap <silent> N  Nzz
nnoremap <silent> *  *zz
nnoremap <silent> #  #zz
xnoremap * :<C-u>call userfunc#keymap#VisualStarSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call userfunc#keymap#VisualStarSearch('?')<CR>?<C-R>=@/<CR><CR>
" TextObject:
" whole buffer
xnoremap <silent> ie GoggV
onoremap <silent> ie :normal vie<CR>
" line
xnoremap <silent> il g_o^
onoremap <silent> il :normal vil<CR>
xnoremap <silent> al $o0
onoremap <silent> al :normal val<CR>
" url
xnoremap <silent> iu :<C-u>call userfunc#textobj#url()<CR>
onoremap <silent> iu :normal viu<CR>
" function argument(NOTE: dont use 'nore')
xmap <silent> ia ifovvi)
omap <silent> ia :normal via<CR>
" BufferOperation:
nnoremap <expr> <silent> <C-h>  (&filetype == 'floaterm') ? ':FloatermPrev<CR>' : ':bprev<CR>'
nnoremap <expr> <silent> <C-l>  (&filetype == 'floaterm') ? ':FloatermNext<CR>' : ':bnext<CR>'
tnoremap <expr> <silent> <C-h>  (&filetype == 'floaterm') ? '<C-\><C-n>:FloatermPrev<CR>' : '<C-\><C-n>:bprev<CR>'
tnoremap <expr> <silent> <C-l>  (&filetype == 'floaterm') ? '<C-\><C-n>:FloatermNext<CR>' : '<C-\><C-n>:bnext<CR>'
" TabOperation:
noremap  <silent> <C-t> <Esc>:tabnew<CR>
" TextCopy:
nnoremap Y y$
nnoremap <Leader>y "+yy
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
" InsertMode: move
inoremap <C-k> <Up>
inoremap <C-j> <Down>
snoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-b> <Esc>bi
inoremap <C-f> <Esc>ea
inoremap <C-a> <Esc>I
inoremap <C-e> <End>
inoremap <C-o> <End><CR>
inoremap <M-o> <Esc>O
inoremap <C-d> <Esc>ddi

nnoremap <silent>       <Leader>w :w<CR>
nnoremap <silent>       <Leader>W :wa<CR>
nnoremap <silent>       gq        q
nnoremap <silent>       gQ        Q
nnoremap <silent>       q         :q!<CR>
nnoremap <silent>       Q         :qa!<CR>
nnoremap <silent><expr> gd        userfunc#keymap#Normal_q()
" nnoremap <silent> <Leader>Q :qa!<CR>
" noremap  <silent> <Leader>d :bp<bar>sp<bar>bn<bar>bd!<bar>:redraw!<CR>
" QuickMessage:
nnoremap <silent> <Leader>m :messages<CR>
nnoremap <silent> <Leader>t :TabMessage messages<CR>
" CommandMode:
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <S-Left>
cnoremap <C-f> <S-Right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" TerminalMode:
tnoremap <Esc>  <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
if has('win32') || has('win64')
  nnoremap <silent> <Leader>n :vert term<CR>
  nnoremap <silent> ,n        :term<CR>
else
  nnoremap <silent> <Leader>n :vsplit term://zsh<CR>
  nnoremap <silent> ,n        :edit term://zsh<CR>
endif
" WindowOperation:
if has('nvim')
  nnoremap <M-h> <C-w>h
  nnoremap <M-j> <C-w>j
  nnoremap <M-k> <C-w>k
  nnoremap <M-l> <C-w>l
  inoremap <M-h> <Esc><C-w>h
  inoremap <M-j> <Esc><C-w>j
  inoremap <M-k> <Esc><C-w>k
  inoremap <M-l> <Esc><C-w>l
  tnoremap <M-h> <C-\><C-n><C-w>h
  tnoremap <M-j> <C-\><C-n><C-w>j
  tnoremap <M-k> <C-\><C-n><C-w>k
  tnoremap <M-l> <C-\><C-n><C-w>l
  cnoremap <expr> <C-n>  pumvisible() ? '<Right>' : '<Down>'
  cnoremap <expr> <C-p>  pumvisible() ? '<Left>' : '<Up>'
  cnoremap <expr> <Up>   pumvisible() ? '<C-p>' : '<up>'
  cnoremap <expr> <Down> pumvisible() ? '<C-n>' : '<down>'
  inoremap <silent> <M-]> <C-R>=userfunc#keymap#FlyOutPairs(']')<CR>
  inoremap <silent> <M-}> <C-R>=userfunc#keymap#FlyOutPairs('}')<CR>
  inoremap <silent> <M-)> <C-R>=userfunc#keymap#FlyOutPairs(')')<CR>
endif
" WindowSize:
if has('nvim')
  nnoremap <M-up>    <C-w>+
  nnoremap <M-down>  <C-w>-
  nnoremap <M-left>  <C-w>5<
  nnoremap <M-right> <C-w>5>
  inoremap <M-up>    <Esc><C-w>+
  inoremap <M-down>  <Esc><C-w>-
  inoremap <M-left>  <Esc><C-w>5<
  inoremap <M-right> <Esc><C-w>5>
endif
" ClearnSearchHighlight:
if has('nvim')
  nnoremap <Esc>      <Cmd>nohlsearch<bar>echo<CR>
endif
nnoremap <silent> <BS>            :noh<bar>echo ''<CR>

noremap  <silent> <F2>             <Esc>:SwitchWindow coc-explorer<CR>
noremap! <silent> <F2>             <Esc>:SwitchWindow coc-explorer<CR>
tnoremap <silent> <F2>             <C-\><C-n>:SwitchWindow coc-explorer<CR>
noremap  <silent> <F3>             <Esc>:SwitchWindow mundo<CR>
noremap! <silent> <F3>             <Esc>:SwitchWindow mundo<CR>
tnoremap <silent> <F3>             <C-\><C-n>:SwitchWindow mundo<CR>
noremap  <silent> <F4>             <Esc>:OpenFileExplorer<CR>
noremap  <silent> <F5>             <Esc>:AsyncTask start<CR>
noremap! <silent> <F5>             <Esc>:AsyncTask start<CR>
noremap  <silent> <Leader>x        <Esc>:AsyncTask start<CR>
noremap  <silent> <Leader><Space>  <Esc>:SwitchWindow qf<CR>
tnoremap <silent> <Leader><Space>  <C-\><C-n>:SwitchWindow qf<CR>
noremap  <silent> <F6>             <Esc>:AutoFormat<CR>
noremap  <silent> <Leader><Leader> <Esc>:AutoFormat<CR>
noremap! <silent> <F6>             <Esc>:AutoFormat<CR>
noremap  <silent> <F10>            <Esc>:SwitchWindow vista<CR>
noremap! <silent> <F10>            <Esc>:SwitchWindow vista<CR>
tnoremap <silent> <F10>            <C-\><C-n>:SwitchWindow vista<CR>
noremap  <silent> <F12>            <Esc>:SwitchWindow floaterm<CR>
noremap! <silent> <F12>            <Esc>:SwitchWindow floaterm<CR>
tnoremap <silent> <F12>            <C-\><C-n>:SwitchWindow floaterm<CR>
nnoremap <expr>   <CR>             userfunc#keymap#Normal_CR() . "\<Esc>"
inoremap <expr>   <CR>             userfunc#keymap#Insert_CR()
inoremap <expr>   <BS>             userfunc#keymap#Insert_BS()
" }}}

" Plugin Config: {{{
" octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight                  = 1
let g:cpp_member_variable_highlight              = 1
let g:cpp_class_decl_highlight                   = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight                     = 1
" plasticboy/vim-markdown
let g:vim_markdown_fenced_languages = ['python=py', 'javascript=js', 'c=c']
let g:vim_markdown_conceal             = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:tex_conceal                      = ""
let g:vim_markdown_math                = 1
" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1
" vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
" lervag/vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_mappings_enabled = 0
let g:vimtex_fold_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk_engines = {'_': '-xelatex'}
let g:vimtex_compiler_latexrun_engines = {'_': 'xelatex'}
" iamcco/markdown-preview.nvim
let g:mkdp_auto_close = 0
" numirias/semshi
let g:semshi#always_update_all_highlights = v:true
let g:semshi#error_sign = v:false
" neoclide/coc.nvim
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
nmap <silent> <C-c> <Plug>(coc-cursors-word)
xmap <silent> <C-c> <Plug>(coc-cursors-range)
nmap <silent> <M-n> <Plug>(coc-diagnostic-next)
nmap <silent> <M-p> <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>ca :CocAction<CR>
nmap <silent> <Leader>cd :call userfunc#utils#GoToDefinition()<CR>
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cf <Plug>(coc-fix-current)
nmap <silent> <Leader>cr <Plug>(coc-references)
nmap <silent> <Leader>cc :CocRestart<CR>
nmap <silent> cl :CocList<CR>
nmap <silent> <Leader>ct :CocList tasks<CR>
nmap <silent> ,cr        :call CocAction('rename')<CR>
xmap if <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-a)
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
" coc-git
nmap <expr> <C-up>   &diff==1 ? '[c' : '<Plug>(coc-git-prevchunk)'
nmap <expr> <C-down> &diff==1 ? ']c' : '<Plug>(coc-git-nextchunk)'
nmap <expr> gk       &diff==1 ? '[c' : '<Plug>(coc-git-prevchunk)'
nmap <expr> gj       &diff==1 ? ']c' : '<Plug>(coc-git-nextchunk)'
nnoremap <silent> <Leader>hs :CocCommand git.chunkStage<CR>
nnoremap <silent> <Leader>hu :CocCommand git.chunkUndo<CR>
nnoremap <silent> <Leader>go :CocCommand git.browserOpen<CR>
nnoremap <silent> <Leader>gv :CocCommand git.chunkInfo<CR>
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
if has('nvim')
  let SignColumnGuiBg = matchstr(execute('hi SignColumn'), 'guibg=\zs\S*')
  if SignColumnGuiBg ==# ''
    let SignColumnGuiBg = 'NONE'
  endif
  exe 'hi GitAdd                guifg=#00FF00 guibg=' . SignColumnGuiBg
  exe 'hi GitModify             guifg=#00FFFF guibg=' . SignColumnGuiBg
  exe 'hi GitDeleteTop          guifg=#FF2222 guibg=' . SignColumnGuiBg
  exe 'hi GitDeleteBottom       guifg=#FF2222 guibg=' . SignColumnGuiBg
  exe 'hi GitDeleteTopAndBottom guifg=#FF2222 guibg=' . SignColumnGuiBg
  exe 'hi CocHintSign           guifg=#15aabf guibg=' . SignColumnGuiBg
  exe 'hi CocInfoSign           guifg=#fab005 guibg=' . SignColumnGuiBg
  exe 'hi CocWarningSign        guifg=#ff922b guibg=' . SignColumnGuiBg
  exe 'hi CocErrorSign          guifg=#ff0000 guibg=' . SignColumnGuiBg
  unlet SignColumnGuiBg
  " coclist will(might) change my cursor highlight
  hi Cursor gui=reverse guifg=NONE guibg=NONE
endif
" coc-pairs
let g:coc_pairs_expand = [['（', '）'], ['“', '”'], ['‘', '’'], ['《', '》']]
" coc-smartf
" nmap f <Plug>(coc-smartf-forward)
" nmap F <Plug>(coc-smartf-backward)
" autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
" autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
" coc-bookmark
nmap <silent> ,b <Plug>(coc-bookmark-toggle)
nmap <silent> ,a <Plug>(coc-bookmark-annotate)
nmap <silent> gh <Plug>(coc-bookmark-prev)
nmap <silent> gl <Plug>(coc-bookmark-next)
" coc-snippets
let g:coc_snippet_next = '<tab>'
" coc extensions
let g:coc_global_extensions = [
  \ 'coc-bookmark',
  \ 'coc-browser',
  \ 'coc-clock',
  \ 'coc-cmake',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-dictionary',
  \ 'coc-emmet',
  \ 'coc-emoji',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-floaterm',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-kite',
  \ 'coc-lists',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-post',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-rls',
  \ 'coc-snippets',
  \ 'coc-syntax',
  \ 'coc-tag',
  \ 'coc-tasks',
  \ 'coc-template',
  \ 'coc-todolist',
  \ 'coc-translator',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-vimtex',
  \ 'coc-yank',
  \ 'coc-zi'
\ ]
" coc-explorer
augroup coc-explorer-settings
  autocmd!
  autocmd FileType coc-explorer setlocal relativenumber
augroup END
" Yggdroot/indentLine
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
let g:indentLine_fileTypeExclude = ['startify', 'vista', 'json', 'codi', 'vtm', 'jsonc', 'coc-explorer']
" mhinz/vim-startify
let g:webdevicons_enable_startify = 1
noremap <silent> <Space> <Esc>:Startify<CR>
let g:startify_bookmarks = [
  \ {'c': '~/.config/nvim/coc-settings.json'},
  \ {'v': '~/.config/nvim/init.vim'}
\ ]
let g:startify_files_number = 8
let g:startify_padding_left = 15
let g:startify_custom_header = [
  \ '                      ___       ___       ___       ___       ___       ___       ___       ___   ',
  \ '                     /\__\     /\  \     /\__\     /\  \     /\  \     /\__\     /\  \     /\  \  ',
  \ '                    /:/ _/_   /::\  \   /:/  /    /::\  \   _\:\  \   /:/ _/_   /::\  \   /::\  \ ',
  \ '                   |::L/\__\ /:/\:\__\ /:/__/    /:/\:\__\ /\/::\__\ /::-"\__\ /\:\:\__\ /\:\:\__\',
  \ '                   |::::/  / \:\/:/  / \:\  \    \:\/:/  / \::/\/__/ \;:;-",-" \:\:\/__/ \:\:\/__/',
  \ '                    L;;/__/   \::/  /   \:\__\    \::/  /   \:\__\    |:|  |    \::/  /   \::/  / ',
  \ '                               \/__/     \/__/     \/__/     \/__/     \|__|     \/__/     \/__/  ']
autocmd User Startified setlocal buflisted
if has('nvim')
  highlight StartifyHeader guifg=#FF00FF
  highlight StartifyNumber guifg=#00FF00
  highlight StartifyPath   guifg=#00AFFF
  highlight StartifySlash  guifg=#DF875F
endif
" itchyny/lightline.vim
let g:lightline = {
  \ 'colorscheme': 'aurora',
  \ 'active': {
    \ 'left': [
      \ ['mode', 'paste'],
      \ ['fugitive', 'readonly', 'filename'],
      \ ['absolutepath']
    \ ],
    \ 'right': [
      \ ['asyncrun_status'],
      \ ['lineinfo'],
      \ ['percent'],
      \ ['cocstatus', 'fileformat', 'fileencoding'],
      \ ['filetype'],
      \ ['codelf_status'],
    \ ]
  \ },
  \ 'component': {
    \ 'lineinfo': ' %4l,%-3v',
    \ 'codelf_status': '%{g:codelf_status}',
    \ 'asyncrun_status': '%{g:asyncrun_status}',
    \ 'close': '%{has("nvim") ? " NVIM " : " VIM "}',
    \ 'vim_logo': "\ue7c5"
  \ },
  \ 'component_function': {
    \ 'mode': 'userfunc#lightline#Mode',
    \ 'fugitive': 'userfunc#lightline#GitBranch',
    \ 'cocstatus': 'coc#status',
    \ 'readonly': 'userfunc#lightline#ReadOnly',
    \ 'filename': 'userfunc#lightline#FileName',
    \ 'fileformat': 'userfunc#lightline#FileFormat',
    \ 'fileencoding': 'userfunc#lightline#FileEncoding',
    \ 'filetype': 'userfunc#lightline#FileType',
    \ 'absolutepath': 'userfunc#lightline#AbsPath'
  \ },
  \ 'tabline': {
    \ 'left': [['vim_logo', 'buffers']],
    \ 'right': [['close']],
    \ 'subseparator': {
      \ 'left': '│',
      \ 'right': '│'
    \ }
  \ },
  \ 'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
  \ 'component_type': { 'buffers': 'tabsel' },
  \ 'subseparator': {
    \ 'left': '│',
    \ 'right': '│'
  \ }
\ }
" mengelbrecht/lightline-bufferline
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#show_number  = 3
let g:lightline#bufferline#number_map = {
  \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
  \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'
\ }
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
" skywind3000/asyncrun.vim
let g:asyncrun_status = ''  " asyncrun is lazy loaded
let g:asyncrun_open = 9
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg', '.idea', '.gitignore', 'Makefile', 'CMakeLists.txt']
" skywind3000/asynctasks.vim
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_reuse = 1
let g:asynctasks_term_rows = 10
" Yggdroot/LeaderF
nmap <silent> <Leader>ff :Leaderf file<CR>
nmap <silent> <Leader>fb :Leaderf buffer<CR>
nmap <silent> <Leader>fm :Leaderf mru<CR>
nmap <silent> <Leader>fg :Leaderf rg<CR>
nmap <silent> <Leader>ft :LeaderfBufTagAll<CR>
noremap <silent> <Leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <silent> <Leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <silent> <Leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <silent> <Leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_StlSeparator   = {'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers    = ['.project', '.svn', '.git', '.idea']
let g:Lf_MruFileExclude = ['*.so','*.py[c0]','*.exe','*.sw?']
let g:Lf_DefaultExternalTool = ""
let g:Lf_UseVersionControlTool = 0
let g:Lf_RgConfig = [
    \ "--glob=!OmegaOptions.bak",
    \ "--glob=!node_modules",
    \ "--no-ignore"
\ ]
let g:Lf_WildIgnore = {
  \ 'dir': [
    \ '.svn',
    \ '.git',
    \ '.hg',
    \ '.cache',
    \ '.idea',
    \ '.android',
    \ '.gradle',
    \ '.IntelliJIdea*',
    \ 'node_modules'
  \ ],
  \ 'file': [
    \ '*.sw?',
    \ '~$*',
    \ '*.exe',
    \ '*.o',
    \ '*.so',
    \ '*.py[co]'
  \ ]
\ }
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_CacheDirectory       = expand('~/.cache/nvim')
let g:Lf_ShowRelativePath     = 1
let g:Lf_HideHelp             = 1
let g:Lf_ShowHidden           = 1
let g:Lf_PreviewResult        = {'Function':0, 'BufTag':0}
let g:Lf_IndexTimeLimit       = 10
let g:Lf_Ctags                = "/usr/local/bin/ctags"
" let g:Lf_PreviewCode = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewInPopup = 1
" let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight = 0.4
let g:Lf_FilerShowDevIcons = 1
" voldikss/vim-browser-search
nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual
let g:browser_search_engines = {
  \ 'qt': 'https://doc.qt.io/qt-5/search-results.html?q=%s'
  \ }
" voldikss/vim-translator
nmap <silent>    ,t        <Plug>Translate
nmap <silent>    ,w        <Plug>TranslateW
nmap <silent>    ,r        <Plug>TranslateR
vmap <silent>    ,t        <Plug>TranslateV
vmap <silent>    ,w        <Plug>TranslateWV
vmap <silent>    ,r        <Plug>TranslateRV
let g:translator_history_enable = 1
let g:translator_default_engines = ['ciba', 'youdao']
" voldikss/vim-floaterm
let g:floaterm_position = 'center'
" let g:floaterm_type = 'normal'
" let g:floaterm_keymap_new    = '<F7>'
" let g:floaterm_keymap_prev   = '<F8>'
" let g:floaterm_keymap_next   = '<F9>'
" let g:floaterm_keymap_toggle = '<F12>'
" simnalamburt/vim-mundo
let g:mundo_width              = 30
let g:mundo_preview_height     = 10
let g:mundo_right              = 0
let g:mundo_preview_bottom     = 1
let g:mundo_auto_preview_delay = 10
" lfv89/vim-interestingwords
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
vnoremap <silent> <leader>k :call InterestingWords('v')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
" tommcdo/vim-exchange
nmap <silent> cx  <Plug>(Exchange)
xmap <silent> X   <Plug>(Exchange)
nmap <silent> cxc <Plug>(ExchangeClear)
nmap <silent> cxx <Plug>(ExchangeLine)
" matze/vim-move
let g:move_map_keys    = 0
let g:move_auto_indent = 1
vmap <silent> J <Plug>MoveBlockDown
vmap <silent> K <Plug>MoveBlockUp
nmap <silent> J <Plug>MoveLineDown
nmap <silent> K <Plug>MoveLineUp
" andrewradev/sideways.vim
nnoremap <silent> <C-left>  :SidewaysLeft<CR>
nnoremap <silent> <C-right> :SidewaysRight<CR>
omap as <Plug>SidewaysArgumentTextobjA
xmap as <Plug>SidewaysArgumentTextobjA
omap is <Plug>SidewaysArgumentTextobjI
xmap is <Plug>SidewaysArgumentTextobjI
" foosoft/vim-argwrap
noremap <silent> <Leader>aw :ArgWrap<CR>
" junegunn/vim-easy-align
xmap <silent> ga <Plug>(EasyAlign)
nmap <silent> ga <Plug>(EasyAlign)
" rhysd/git-messenger
noremap <silent> <Leader>gm :GitMessenger<CR>
" puremourning/vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" }}}
