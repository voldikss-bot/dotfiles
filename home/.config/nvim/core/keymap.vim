" ============================================================================
" FileName: keymap.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

let mapleader   = ';'
let g:mapleader = ';'
noremap  H  ^
noremap  L  $
nmap     M  %
omap     M  %
xmap     M  %
noremap  U  <C-R>
noremap  '  `
vnoremap <  <gv
vnoremap >  >gv
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz

nnoremap <silent> <C-j>      <C-]>
nnoremap <silent> <C-k>      :<C-u>call lib#coc#ShowDocument()<CR>
nnoremap <silent> <C-w><C-j> <C-W>v<C-]>zz

" BufferOperation:
nnoremap <silent> <C-h>  :bprev<CR>
nnoremap <silent> <C-l>  :bnext<CR>

" TabOperation:
noremap  <silent> <C-t> <Esc>:tabnew<CR>

" TextCopy:
nnoremap Y y$
nnoremap <silent> <Leader>y "+yy
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>Y "+y$
nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P

" InsertMode: move
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>
inoremap <silent> <C-b> <C-r>=lib#keymap#Exec('normal! b')<CR>
inoremap <silent> <C-f> <C-r>=lib#keymap#Exec('normal! w')<CR>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-o> <End><CR>
inoremap <silent> <M-o> <Esc>O
inoremap <silent> <C-d> <Esc>ddi

nnoremap <silent>       <Leader>w :w<CR>
nnoremap <silent>       <Leader>W :wa<CR>
nnoremap <silent>       <Leader>q q
nnoremap <silent>       <Leader>Q Q
" nnoremap <silent>       q         :q!<CR>
" nnoremap <silent>       Q         :qa!<CR>
" nnoremap <silent><expr> <Leader>d lib#keymap#Normal_q()

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

noremap  <silent> <F2>             <Esc>:CocCommand explorer<CR>
noremap! <silent> <F2>             <Esc>:CocCommand explorer<CR>
noremap  <silent> <F3>             <Esc>:MundoToggle<CR>
noremap! <silent> <F3>             <Esc>:MundoToggle<CR>
tnoremap <silent> <F3>             <C-\><C-n>:MundoToggle<CR>
noremap  <silent> <F4>             <Esc>:OpenFileExplorer<CR>
noremap  <silent> <F5>             <Esc>:AsyncTask start<CR>
noremap! <silent> <F5>             <Esc>:AsyncTask start<CR>
noremap  <silent> <F6>             <Esc>:AutoFormat<CR>
noremap! <silent> <F6>             <Esc>:AutoFormat<CR>
noremap  <silent> <F10>            <Esc>:Vista!!<CR>
noremap! <silent> <F10>            <Esc>:Vista!!<CR>
noremap  <silent> <F12>            <Esc>:FloatermToggle<CR>
noremap! <silent> <F12>            <Esc>:FloatermToggle<CR>
tnoremap <silent> <F12>            <C-\><C-n>:FloatermToggle<CR>
inoremap <expr>   <CR>             lib#keymap#Insert_CR()
