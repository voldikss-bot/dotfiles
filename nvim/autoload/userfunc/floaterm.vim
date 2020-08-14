" ============================================================================
" FileName: floaterm.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

function! userfunc#floaterm#WatchCallback(job, data, event) abort
  if a:event == 'stdout'
    if match(a:data, '\CERROR') > -1
      let g:asyncrun_status = 'yarn watch error'
    else
      let g:asyncrun_status = 'yarn watching'
    endif
  elseif a:event == 'stderr'
    let g:asyncrun_status = ''
  else
    let g:asyncrun_status = 'yarn watch failed'
  endif
endfunction
