noremap <silent> <Space><Space> <Esc>:Startify<CR>
if has('nvim')
  let g:startify_bookmarks = [
    \ {'c': stdpath('config') . '/coc-settings.json'},
    \ {'v': stdpath('config') . '/init.vim'}
  \ ]
endif
let g:startify_files_number = 8
let g:startify_padding_left = 15
" let g:startify_custom_header = [
"   \ '                      ___       ___       ___       ___       ___       ___       ___       ___   ',
"   \ '                     /\__\     /\  \     /\__\     /\  \     /\  \     /\__\     /\  \     /\  \  ',
"   \ '                    /:/ _/_   /::\  \   /:/  /    /::\  \   _\:\  \   /:/ _/_   /::\  \   /::\  \ ',
"   \ '                   |::L/\__\ /:/\:\__\ /:/__/    /:/\:\__\ /\/::\__\ /::-"\__\ /\:\:\__\ /\:\:\__\',
"   \ '                   |::::/  / \:\/:/  / \:\  \    \:\/:/  / \::/\/__/ \;:;-",-" \:\:\/__/ \:\:\/__/',
"   \ '                    L;;/__/   \::/  /   \:\__\    \::/  /   \:\__\    |:|  |    \::/  /   \::/  / ',
"   \ '                               \/__/     \/__/     \/__/     \/__/     \|__|     \/__/     \/__/  ']
if has('nvim')
  highlight StartifyHeader guifg=#FF00FF
  highlight StartifyNumber guifg=#00FF00
  highlight StartifyPath   guifg=#00AFFF
  highlight StartifySlash  guifg=#DF875F
endif
