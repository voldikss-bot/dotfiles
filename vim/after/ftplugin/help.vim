" Jump to links with enter
nmap <silent> <buffer> <CR> <C-]>

" Jump back with backspace
nmap <silent> <buffer> <BS> <C-T>
" q to quit
nmap <silent> <buffer> q :quit<CR>
" open help file in the left window
" alternative: e.g. vert help syntax
autocmd BufWinEnter <buffer> wincmd H

setlocal number
setlocal nospell
