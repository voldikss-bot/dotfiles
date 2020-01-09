" vim:et sw=2 ts=2 fdm=marker fmr=[[[,]]]
" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

" LeaderKey: [[[1
let mapleader   = ';'
let g:mapleader = ';'
" General: [[[1
noremap  H  ^
noremap  L  $
" Esc
inoremap <C-c> <C-R>=keymapfunc#esc()<CR>
inoremap <C-[> <C-R>=keymapfunc#esc()<CR>
inoremap <Esc> <C-r>=keymapfunc#esc()<CR>
"cannot use noremap
nnoremap     M  %
vnoremap     M  %
noremap  U  <C-R>
noremap  '  `
vnoremap <  <gv
vnoremap >  >gv
noremap <C-U> kkkkkkkkkkkkkkkkkkkkk
noremap <C-D> jjjjjjjjjjjjjjjjjjjjj
" Jump: [[[1
noremap <silent> <C-j>      <C-]>
noremap <silent> <C-W><C-j> <C-W><C-]>
noremap <silent> <C-k>      :<C-u>call utils#showdoc()<CR>
" Search: [[[1
" use set shortmess-=S to display searchindex
nnoremap <silent> n  nzz
nnoremap <silent> N  Nzz
nnoremap <silent> *  *zz
nnoremap <silent> #  #zz
xnoremap * :<C-u>call keymapfunc#VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call keymapfunc#VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>
" TextObject: [[[1
" whole buffer
xnoremap ie GoggV
onoremap ie :normal vie<CR>
" line
xnoremap il g_o^
onoremap il :normal vil<CR>
xnoremap al $o0
onoremap al :normal val<CR>
" argument
xmap ia ifovvi)
omap ia :normal via<CR>
" BufferOperation: [[[1
nnoremap <expr> <silent> <C-h>  (&buftype == 'terminal') ? ':FloatermPrev<CR>' : ':bprev<CR>'
nnoremap <expr> <silent> <C-l>  (&buftype == 'terminal') ? ':FloatermNext<CR>' : ':bnext<CR>'
tnoremap <expr> <silent> <C-h>  (&buftype == 'terminal') ? '<C-\><C-n>:FloatermPrev<CR>' : '<C-\><C-n>:bprev<CR>'
tnoremap <expr> <silent> <C-l>  (&buftype == 'terminal') ? '<C-\><C-n>:FloatermNext<CR>' : '<C-\><C-n>:bnext<CR>'
noremap  <silent> <Leader>d :bp<bar>sp<bar>bn<bar>bd!<CR>
" TabOperation: [[[1
noremap  <silent> <C-t> <Esc>:tabnew<CR>
" TextCopy: [[[1
nnoremap Y y$
nnoremap <Leader>y "+yy
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
" InsertMode: move [[[1
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
" SaveAndQuit: [[[1
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>W :wa<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :qa!<CR>
nnoremap <silent> Q         :qa!<CR>
" QuickMessage: [[[1
nnoremap <silent> <Leader>m :messages<CR>
nnoremap <silent> <Leader>t :TabMessage messages<CR>
" CommandMode: [[[1
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <S-Left>
cnoremap <C-f> <S-Right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" TerminalMode: [[[1
tnoremap <Esc>  <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
if has('win32') || has('win64')
  nnoremap <silent> <Leader>n :vert term<CR>
  nnoremap <silent> ,n        :term<CR>
else
  nnoremap <silent> <Leader>n :vsplit term://zsh<CR>
  nnoremap <silent> ,n        :edit term://zsh<CR>
endif
" WindowOperation: [[[1
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
" WindowSize: [[[1
if has('nvim')
  noremap <M-up>    <C-w>+
  noremap <M-down>  <C-w>-
  noremap <M-left>  <C-w>5<
  noremap <M-right> <C-w>5>
endif
" ClearnSearchHighlight:  [[[1
if has('nvim')
  nnoremap <Esc>      <Cmd>nohlsearch<bar>echo ''<CR>
endif
nnoremap <silent> <BS>            :noh<bar>echo ''<CR>
noremap  <silent> <F2>            <Esc>:call winmgr#Toggle('coc-explorer')<CR>
noremap! <silent> <F2>            <Esc>:call winmgr#Toggle('coc-explorer')<CR>
tnoremap <silent> <F2>            <C-\><C-n>:call winmgr#Toggle('coc-explorer')<CR>
noremap  <silent> <F3>            <Esc>:call winmgr#Toggle('mundo')<CR>
noremap! <silent> <F3>            <Esc>:call winmgr#Toggle('mundo')<CR>
tnoremap <silent> <F3>            <C-\><C-n>:call winmgr#Toggle('mundo')<CR>
noremap  <silent> <F4>            <Esc>:call utils#OpenFileExplore()<CR>
noremap  <silent> <F5>            <Esc>:call quickrun#run()<CR>
noremap! <silent> <F5>            <Esc>:call quickrun#run()<CR>
noremap  <silent> <Leader>x       <Esc>:call quickrun#run()<CR>
noremap  <silent> <Leader><Space> <Esc>:call winmgr#Toggle('qf')<CR>
tnoremap <silent> <Leader><Space> <C-\><C-n>:call winmgr#Toggle('qf')<CR>
noremap  <silent> <F6>            <Esc>:call utils#AutoFormat()<CR>
noremap  <silent> ;;              <Esc>:call utils#AutoFormat()<CR>
noremap! <silent> <F6>            <Esc>:call utils#AutoFormat()<CR>
noremap  <silent> <F10>           <Esc>:call winmgr#Toggle('vista')<CR>
noremap! <silent> <F10>           <Esc>:call winmgr#Toggle('vista')<CR>
tnoremap <silent> <F10>           <C-\><C-n>:call winmgr#Toggle('vista')<CR>
noremap  <silent> <F12>           <Esc>:call winmgr#Toggle('terminal')<CR>
noremap! <silent> <F12>           <Esc>:call winmgr#Toggle('terminal')<CR>
tnoremap <silent> <F12>           <C-\><C-n>:call winmgr#Toggle('terminal')<CR>
nnoremap <expr>   <CR>            keymapfunc#NormalMapForCR() . "\<Esc>"
inoremap <expr>   <CR>            keymapfunc#InsertMapForCR()
inoremap <expr>   <BS>            keymapfunc#InsertMapForBS()
