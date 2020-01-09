" vim-startify
let g:webdevicons_enable_startify = 1
noremap <silent> <Space> <Esc>:Startify<CR>
let g:startify_bookmarks = [
  \ {'c': '~/.config/nvim/coc-settings.json'},
  \ {'p': '~/.config/nvim/init/plugins.vim'},
  \ {'v': '~/.config/nvim/init.vim'},
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
