" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" FlyOutPairs:
function! userfunc#keymap#FlyOutPairs(key)
  return "\<ESC>:call search("."'".a:key."'".")\<CR>a"
endfunction

" InsertMap_BS:
function! userfunc#keymap#Insert_BS() abort
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

"Insert_CR:
function! userfunc#keymap#Insert_CR() abort
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

" Insert_ESC:
function! userfunc#keymap#Insert_ESC()
  let colnr = getpos('.')[2]
  let linelen = len(getline('.'))
  if colnr == (linelen + 1)
    return "\<Esc>"
  else
    return "\<Esc>\<Right>"
  endif
endfunction

" Normal_CR:
function! userfunc#keymap#Normal_CR() abort
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

" VisualStarSearch:
function! userfunc#keymap#VisualStarSearch(cmdtype, ...) abort
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
endfunction
