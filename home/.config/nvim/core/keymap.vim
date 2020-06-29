" ============================================================================
" FileName: keymap.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

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
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz
" Move:
nnoremap <silent> [[  :<C-u>call userfunc#keymap#Square_Brackets_Left()<CR>
nnoremap <silent> ]]  :<C-u>call userfunc#keymap#Square_Brackets_Right()<CR>
vnoremap <silent> [[  {j
vnoremap <silent> ]]  }k
" Jump:
noremap <silent> <C-j>      <C-]>
noremap <silent> <C-k>      :<C-u>call userfunc#coc#ShowDocument()<CR>
nnoremap <silent> <C-w><C-j> <C-W>v<C-]>zz
nnoremap <silent> <C-w><C-o> :<C-u>call userfunc#utils#Return()<CR>
" Search:
" use set shortmess-=S to display searchindex
nnoremap <silent> n  nzz
nnoremap <silent> N  Nzz
nnoremap * m`:keepjumps normal! *``zz<cr>
nnoremap # #zz
xnoremap * :<C-u>call userfunc#keymap#VisualStarSearch('/')<CR>/<C-R>=@/<CR><CR>N
xnoremap # :<C-u>call userfunc#keymap#VisualStarSearch('?')<CR>?<C-R>=@/<CR><CR>n
" TextObject:
" whole buffer
xnoremap <silent> ie GoggV
onoremap <silent> ie :normal vie<CR>
" line
xnoremap <silent> il g_o^
onoremap <silent> il :normal vil<CR>
xnoremap <silent> al $o0
onoremap <silent> al :normal val<CR>
" block comment
xnoremap i? [*o]*
onoremap i? :<C-u>normal va?V<CR>
" url
xnoremap <silent> iu :<C-u>call userfunc#textobj#url()<CR>
onoremap <silent> iu :normal viu<CR>
" ip
xnoremap <silent> iI :<C-u>call userfunc#textobj#ip()<CR>
onoremap <silent> iI :normal viI<CR>
" number
xnoremap <silent> in :<C-u>call userfunc#textobj#number()<CR>
onoremap <silent> in :normal vin<CR>
" function argument
xnoremap <silent> ia :<C-u>call userfunc#textobj#arguments(1, 1)<CR>
xnoremap <silent> aa :<C-u>call userfunc#textobj#arguments(0, 1)<CR>
onoremap <silent> ia :<C-u>call userfunc#textobj#arguments(1, 0)<CR>
onoremap <silent> aa :<C-u>call userfunc#textobj#arguments(0, 0)<CR>
" BufferOperation:
nnoremap <expr> <silent> <C-h>  (&filetype == 'floaterm') ? ':FloatermPrev<CR>' : ':bprev<CR>'
nnoremap <expr> <silent> <C-l>  (&filetype == 'floaterm') ? ':FloatermNext<CR>' : ':bnext<CR>'
" tnoremap <expr> <silent> <C-h>  (&filetype == 'floaterm') ? '<C-\><C-n>:FloatermPrev<CR>' : '<C-\><C-n>:bprev<CR>'
" tnoremap <expr> <silent> <C-l>  (&filetype == 'floaterm') ? '<C-\><C-n>:FloatermNext<CR>' : '<C-\><C-n>:bnext<CR>'
" TabOperation:
noremap  <silent> <C-t> <Esc>:tabnew<CR>
" TextCopy:
nnoremap Y y$
nnoremap <silent> <Leader>y "+yy
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>Y "+y$
nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P
vnoremap <silent> <Leader>Y :<C-u>call userfunc#keymap#incyank()<CR>
vnoremap <silent> <Leader>D :<C-u>call userfunc#keymap#incdelete()<CR>
" InsertMode: move
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-j> <Down>
" snoremap <silent> <C-j> <Down>
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>
inoremap <silent> <C-b> <C-r>=userfunc#keymap#Exec('normal! b')<CR>
inoremap <silent> <C-f> <C-r>=userfunc#keymap#Exec('normal! w')<CR>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-o> <End><CR>
inoremap <silent> <M-o> <Esc>O
inoremap <silent> <C-d> <Esc>ddi

nnoremap <silent>       <Leader>w :w<CR>
nnoremap <silent>       <Leader>W :wa<CR>
nnoremap <silent>       <Leader>q q
nnoremap <silent>       <Leader>Q Q
nnoremap <silent>       q         :q!<CR>
nnoremap <silent>       Q         :qa!<CR>
nnoremap <silent><expr> <Leader>d userfunc#keymap#Normal_q()
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
" cnoremap <expr> '    userfunc#keymap#Command_Pairs("''")
cnoremap <expr> <    userfunc#keymap#Command_Pairs('<>')
" cnoremap <expr> (    userfunc#keymap#Command_Pairs('()')
cnoremap <expr> [    userfunc#keymap#Command_Pairs('[]')
cnoremap <expr> {    userfunc#keymap#Command_Pairs('{}')
cnoremap <expr> <BS> userfunc#keymap#Command_BS()
" TerminalMode:
tnoremap <Esc>  <C-\><C-n>
" tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
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
noremap  <silent> <F5>             <Esc>:QuickRun<CR>
noremap! <silent> <F5>             <Esc>:QuickRun<CR>
noremap  <silent> <Leader>x        <Esc>:QuickRun<CR>
noremap  <silent> <Leader><Space>  <Esc>:SwitchWindow qf<CR>
" tnoremap <silent> <Leader><Space>  <C-\><C-n>:SwitchWindow qf<CR>
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
