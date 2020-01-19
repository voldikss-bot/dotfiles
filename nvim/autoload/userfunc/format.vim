" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" AutoFormat:
function! userfunc#format#AutoFormat() abort
  let curr_pos = getpos('.')
  " 1. use coc
  call CocAction('format')
  " 2. remove whitespace
  call s:RemoveWhiteSpaces()
  " 3. remove blank lines
  call s:RemoveBlankLines()
  if expand('%') != ''
    update
  endif
  call setpos('.', curr_pos)
endfunction

" AutoSave:
function! userfunc#format#AutoSave() abort
  let curr_pos = getpos('.')
  if getpos('.')[1] != line('$')
    call s:RemoveBlankLines()
  endif
  if trim(getline('.')) != ''
    call s:RemoveWhiteSpaces()
  endif
  if expand('%') != '' | update | endif
  call setpos('.', curr_pos)
endfunction

" RemoveBlankLines:
function! s:RemoveBlankLines() abort
  if !&modifiable
    return
  endif
  let reg_tmp = @"
  while 1
    let endlnum = line('$')
    let endline = getline(endlnum)
    if trim(endline) == '' && endlnum != 1
      execute endlnum . 'd'
    else
      break
    endif
  endwhile
  let @" = reg_tmp
endfunction

" RemoveWhiteSpaces:
function! s:RemoveWhiteSpaces()
  silent! execute '%s/\s\+$//g'
endfunction
