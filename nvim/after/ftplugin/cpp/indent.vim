" Modified from https://vim.fandom.com/wiki/Indenting_for_Qt_C%2B%2B

" This file contains indentation for qtcpp and other standard cpp language

" Indent of `public/private/protected signals/slots` is &shiftwidth - 2
" Indent of `Q_OBJECT` is &shiftwidth
" See L12-18 and L44-49

function! QtCppIndent()
  " Patterns used to recognise labels and search for the start
  " of declarations
  let qt_label_pat1='signals:\|slots:\|public:\|protected:\|private:'
  let qt_label_pat2 = 'Q_OBJECT'
  let other_label_pat = 'break;'
  let declpat='\(;\|{\|}\)\_s*.'
  " If the line is a label, it's a no brainer
  if match(getline(v:lnum), qt_label_pat1) != -1
    return &shiftwidth - 2
  endif
  " Use &shiftwidth for Q_OBJECT macro
  if match(getline(v:lnum), qt_label_pat2) != -1
    return &shiftwidth
  endif
  " If the line starts with a closing brace, it's also easy: use cindent
  if match(getline(v:lnum), '^\s*}') != -1
    return cindent(v:lnum)
  endif
  " Save cursor position and move to the line we're indenting
  let pos=getpos('.')
  call setpos('.', [0, v:lnum, 1, 0])
  " Find the beginning of the previous declaration (this is what
  " cindent will mimic)
  call search(declpat, 'beW', v:lnum>10 ? v:lnum-10 : 0)
  let prevlnum = line('.')
  " Find the beginning of the next declaration after that (this may
  " just get us back where we started)
  call search(declpat, 'eW', v:lnum<=line('$')-10 ? v:lnum+10 : 0)
  let nextlnum = line('.')
  " Restore the cursor position
  call setpos('.', pos)
  " If the prevline contains qt_label_pat1, use `&shiftwidth + 2`
  " If contains `Q_OBJECT`, use the same indent as `Q_OBJECT`
  if match(getline(prevlnum), qt_label_pat1) != -1
    return indent(prevlnum) + 2
  elseif match(getline(prevlnum), qt_label_pat2) != -1
    return indent(prevlnum)
  elseif match(getline(prevlnum), other_label_pat) != -1
    return indent(prevlnum) - &shiftwidth
  else
    return cindent(v:lnum)
  endif
  " If the prevline contains `break;`
  " Otherwise we adjust so the beginning of the declaration is one
  " shiftwidth in
  return &shiftwidth
endfunc
setlocal indentexpr=QtCppIndent()
