" vim:et sw=2 ts=2 fdm=marker fmr=[[[,]]]
" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

augroup ParenColor
  autocmd!
  autocmd VimEnter,BufWinEnter *
    \ if index(['html', 'htmldjango', 'tex', 'mma', 'vue'], &filetype) < 0 |
      \ syntax match paren1 /[{}]/   | hi paren1 guifg=#FF00FF |
      \ syntax match paren2 /[()]/   | hi paren2 guifg=#DF8700 |
      \ syntax match paren3 /[<>]/   | hi paren3 guifg=#0087FF |
      \ syntax match paren4 /[\[\]]/ | hi paren4 guifg=#00FF5F |
    \ endif
augroup END

augroup UserAutoSaveBuffer
  autocmd!
  autocmd FocusLost,InsertLeave * call utils#AutoSave()
augroup END

augroup UserDisableAutoComment
  autocmd!
  autocmd FileType * set formatoptions-=cro
augroup END

augroup UserLineNumber
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

augroup UserEqualWindowSize
  autocmd!
  autocmd VimResized * exec "normal \<C-w>="
augroup END

augroup UserJumpToLastPosition
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g'\"" |
    \ endif
augroup END

augroup UserKeywordHighlight
  autocmd!
  autocmd Syntax *
    \ call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)') |
    \ call matchadd('Todo',  '\W\zs\(NOTE\|Note\|INFO\|IDEA\|NOTICE\)') |
    \ call matchadd('Debug', '\W\zs\(Debug\|DEBUG\)') |
augroup END

augroup UserAutoChangeDir
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

augroup UserAutoAddGitignore
  autocmd!
  autocmd BufNewFile .gitignore CocCommand template.templateTop
augroup END

augroup UserChecktime
  autocmd!
  autocmd FocusGained * checktime
augroup END
