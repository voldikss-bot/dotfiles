" 安装
Plug 'matze/vim-move'

" 配置
let g:move_map_keys    = 0
let g:move_auto_indent = 1
vmap <silent> J <Plug>MoveBlockDown
vmap <silent> K <Plug>MoveBlockUp
nmap <silent> J <Plug>MoveLineDown
nmap <silent> K <Plug>MoveLineUp
