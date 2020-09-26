" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" Insert: <CR>
function! lib#keymap#Insert_CR() abort
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

" Normal: q
function! lib#keymap#Normal_q() abort
  " is the last buffer
  if len(getbufinfo({'buflisted':1})) == 1 && winnr('$') == 1 && bufname() == ''
    return ":q!\<CR>"
  else
    return ":bp\<bar>vsp\<bar>bn\<bar>bd!\<bar>:redraw!\<CR>"
  endif
endfunction

function! lib#keymap#Exec(cmd)
  execute a:cmd
  return ''
endfunction
