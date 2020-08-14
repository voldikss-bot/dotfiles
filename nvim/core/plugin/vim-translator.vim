nmap <silent>    ,t        <Plug>Translate
nmap <silent>    ,w        <Plug>TranslateW
nmap <silent>    ,r        <Plug>TranslateR
vmap <silent>    ,t        <Plug>TranslateV
vmap <silent>    ,w        <Plug>TranslateWV
vmap <silent>    ,r        <Plug>TranslateRV
let g:translator_status = ''
let g:translator_history_enable = 1
let g:translator_default_engines = ['baicizhan', 'bing', 'google', 'haici', 'youdao']
let g:translator_window_max_height = 0.8
let g:translator_window_max_width = 0.8
