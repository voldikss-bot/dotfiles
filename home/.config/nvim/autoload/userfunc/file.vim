" ============================================================================
" FileName: file.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" AutoFormat:
function! userfunc#file#AutoFormat() abort
  if &readonly || !&modifiable | return | endif
  let curr_pos = getpos('.')
  " 1. use coc
  call CocAction('format')
  " 2. remove whitespace
  call s:RemoveWhiteSpaces()
  " 3. remove blank lines
  call s:RemoveBlankLines()
  if expand('%') != '' | update | endif
  call setpos('.', curr_pos)
endfunction

" AutoSave:
function! userfunc#file#AutoSave() abort
  if &readonly || !&modifiable | return | endif
  " resolve CocSearch acwrite invcompatibility
  if &buftype == 'acwrite' | return | endif
  let curr_pos = getpos('.')
  if getpos('.')[1] != line('$')
    call s:RemoveBlankLines()
  endif
  if trim(getline('.')) != ''
    call s:RemoveWhiteSpaces()
  endif
  if !empty(expand('%')) | update | endif
  call setpos('.', curr_pos)
endfunction

" RemoveBlankLines:
function! s:RemoveBlankLines() abort
  if !&modifiable | return | endif
  let reg_tmp = @"
  let endlnum = line('$')
  let lastnoblank = prevnonblank(endlnum)
  if endlnum == lastnoblank | return | endif
  execute printf('%s,%sdelete', lastnoblank+1, endlnum)
  let @" = reg_tmp
endfunction

" RemoveWhiteSpaces:
function! s:RemoveWhiteSpaces()
  if mode() ==# 'n'
    silent! keeppatterns keepjumps execute 'undojoin | %s/[ \t]\+$//g'
  endif
endfunction

" RenameFile:
function! userfunc#file#Rename(new_name) abort
  let old_name = expand('%')
  if empty(a:new_name)
    let new_name = input('New file name: ', expand('%'), 'file')
  else
    let new_name = a:new_name
  endif
  if new_name != '' && new_name != old_name
    execute ':saveas ' new_name
    execute ':silent !rm ' old_name
    execute 'bdelete ' old_name
    redraw!
  endif
endfunction

" RemoveFile: remove current file
function! userfunc#file#Remove() abort
  let fname = expand('%')
  execute 'bdelete ' fname
  execute 'silent !rm ' fname
  redraw!
endfunction
