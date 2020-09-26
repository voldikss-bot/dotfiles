let g:mundo_width              = 30
let g:mundo_preview_height     = 10
let g:mundo_right              = 0
let g:mundo_preview_bottom     = 1
let g:mundo_auto_preview_delay = 10
noremap  <silent> <F3>             <Esc>:MundoToggle<CR>
noremap! <silent> <F3>             <Esc>:MundoToggle<CR>
tnoremap <silent> <F3>             <C-\><C-n>:MundoToggle<CR>
