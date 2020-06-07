" ============================================================================
" FileName: asyncrun.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

function! userfunc#asyncrun#term_style(timer) abort
  " to check if the terminal is opened by asyncrun
  if exists('b:asyncrun_cmd')
    setlocal number
  endif
endfunction
