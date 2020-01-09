" vim:fdm=indent
" ========================================================================
" Author: voldikss
" GitHub: https://github.com/voldikss/dotfiles
" Description: functions for keymappings
" ========================================================================

" NormalMapForEnter: <CR>
function! keymapfunc#NormalMapForCR() abort
  if &filetype ==# 'quickfix'
    return "\<CR>"
  else
    let line = trim(getline('.'))
    if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
      if line != ''
        \ && index(['#', '/'], line[0]) < 0
        \ && index([';', '{','[', '(', '\', '<', '>'], line[-1:]) < 0
          return "A;"
      else
        return ""
      endif
    elseif index(['json', 'jsonc'], &filetype) >=0
      if line != ''
        \ && index(['#', '/'], line[0]) < 0
        \ && index([',', '{','['], line[-1:]) < 0
        return "A,"
      else
        return ""
      endif
    else
      return "" " prevent entering to the next line
    endif
  endif
endfunction

" InsertMapForEnter: <CR>
function! keymapfunc#InsertMapForCR() abort
  let line = getline('.') " can not use trim
  if pumvisible()
    return "\<C-y>"
  elseif index([')', ']', '}', '`'], strcharpart(line, getpos('.')[2]-1, 1)) >= 0
    return "\<CR>\<Esc>O"
  elseif strcharpart(line, getpos('.')[2]-1,2) == '</'
    return "\<CR>\<Esc>O"
  else
    return "\<CR>"
  endif
endfunction

" InsertMapForSemicolonEnter: ;<CR>
function! keymapfunc#InsertMapForSemicolonCR() abort
  let line = trim(getline('.'))
  if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
    if line != '' && line[-1:] != ';' && index(['#', '/'], line[0]) < 0
      return "\<End>;\<CR>"
    else
      return "\<Esc>o"
    endif
  elseif index(['json', 'jsonc'], &filetype) >=0
    if line != ''
      \ && index(['#', '/'], line[0]) < 0
      \ && index([',', '{','['], line[-1:]) < 0
      return "\<End>,\<CR>"
    else
      return "\<Esc>o"
    endif
  else
    return "\<Esc>o"
  endif
endfunction

" InsertMapForSemicolonP: ;p
function! keymapfunc#InsertMapForSemicolonP() abort
  if &filetype == 'python'
    let line = trim(getline('.'))
    if line != '' && line[-1:] != ':'
      return "\<End>:\<CR>"
    else
      return ""
    endif
  else
    return "\<End>\<Space>{}\<Left>\<CR>\<Esc>O"
  endif
endfunction

" InsertMapForDoubleSemicolon: ;;
function! keymapfunc#InsertMapForDoubleSemicolon() abort
  let line = trim(getline('.'))
  if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
    if line != '' && line[-1:] != ';' && index(['#', '/'], line[0]) < 0
      return "\<End>;"
    else
      return ""
    endif
  elseif &filetype == 'python'
    if trim(line) != '' && line[-1:] != ':'
      return "\<End>:"
    else
      return ""
    endif
  elseif index(['json', 'jsonc'], &filetype)
    if trim(line) != '' && line[-1:] != ','
      return "\<End>,"
    else
      return ""
    endif
  else
    return ""
  endif
endfunction

" MapForBackspace: <BS>
function! keymapfunc#InsertMapForBS() abort
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    let line = getline('.')       " 此处不能用 trim()
    let colnr = getpos('.')[2]
    let paren = strcharpart(line, colnr-2, 2)
    if index(['()', '[]', '{}', '<>', '%%', '$$', '**', '""', "''", '~~', '``'], paren) >=0
      return "\<Left>\<Del>\<Del>"
    else
      let prefix = line[:colnr-2]
      if prefix =~ '^\s\+$' && len(prefix) % &shiftwidth == 0
        return "\<BS>"
      else
        return "\<Left>\<Del>"
      endif
    endif
  endif
endfunction

" MoveOutPairs:
function! keymapfunc#MoveOutPairs(key)
  return "\<ESC>:call search("."'".a:key."'".")\<CR>a"
endfunction

" Esc:
function! keymapfunc#esc()
  let colnr = getpos('.')[2]
  let linelen = len(getline('.'))
  if colnr == (linelen + 1)
    return "\<Esc>"
  else
    return "\<Esc>\<Right>"
  endif
endfunction

" VisualStarSearch:
function! keymapfunc#VisualStarSearchSet(cmdtype, ...) abort
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
  let @" = temp
endfunction
