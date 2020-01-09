" vim:et sw=2 ts=2 fdm=marker fmr=[[[,]]]
" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

if !has('nvim') | finish | endif

if matchstr(execute('silent version'), 'NVIM v\zs[^\n-]*') >= '0.4.0'
  set inccommand=nosplit
  set wildoptions+=pum
  set signcolumn=yes:2
  set pumblend=10
endif

augroup UserTermSettings
  autocmd!
  autocmd TermOpen *
    \ setlocal signcolumn=no |
    \ setlocal nobuflisted |
    \ setlocal nospell |
    \ nmap <silent><buffer> <Esc> :hide<CR>
augroup END
