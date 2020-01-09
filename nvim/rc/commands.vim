" vim:et sw=2 ts=2 fdm=marker fmr=[[[,]]]
" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

" Commons: [[[1
command! -nargs=+ Grep               call utils#Grep(<q-args>)
command! -nargs=? QuickRunSetCommand call quickrun#Setcmd(<f-args>)
command! -nargs=+ -complete=command  TabMessage call utils#TabMessage(<q-args>)
" Dein: [[[1
command! PI  call dein#install()
command! PR  call dein#recache_runtimepath()
command! PU  call dein#update()

