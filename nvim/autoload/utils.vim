" vim:fdm=indent
" ========================================================================
" Description: autoload/util.vim
" Author: voldikss
" GitHub: https://github.com/voldikss/dotfiles
" ========================================================================

" TabMessage: capture command output
function! utils#TabMessage(cmd) abort
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    call utils#showmsg('No Output', 'warning')
  else
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
" BrowserOpen: open file or url
function! utils#BrowserOpen(obj) abort
  " windows(mingw)
  if has('win32') || has('win64') || has('win32unix')
    let cmd = 'rundll32 url.dll,FileProtocolHandler ' . a:obj
  elseif has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin'
    let cmd = 'open ' . a:obj
  elseif executable('xdg-open')
    let cmd = 'xdg-open ' . a:obj
  else
    echoerr "No browser found, please contact the developer."
  endif
  exec 'AsyncRun -post=cclose' . ' ' . cmd
endfunction
" FileExplore: open cwd in file explore
function! utils#OpenFileExplore() abort
  let path = expand(getcwd())
  call utils#BrowserOpen(path)
endfunction
" Autoformat: format code
function! utils#AutoFormat() abort
  let curr_pos = getpos('.')
  " 1. use coc
  call CocAction('format')
  " 2. remove whitespace
  call utils#RemoveWhiteSpeces()
  " 3. remove blank lines
  call utils#RemoveBlankLines()
  if expand('%') != ''
    update
  endif
  call setpos('.', curr_pos)
endfunction
" RemoveBlankLines:
function! utils#RemoveBlankLines() abort
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
function! utils#RemoveWhiteSpeces()
  silent! execute '%s/\s\+$//g'
endfunction
" AutoSaveBuffer:
function! utils#AutoSave() abort
  let curr_pos = getpos('.')
  if getpos('.')[1] != line('$')
    call utils#RemoveBlankLines()
  endif
  if trim(getline('.')) != ''
    call utils#RemoveWhiteSpeces()
  endif
  if expand('%') != '' | update | endif
  " TODO
  " if index(['html', 'htmldjango', 'css'], &filetype) >= 0
  "   BLReloadPage
  " endif
  call setpos('.', curr_pos)
endfunction
" Grep:
function! utils#Grep(string) abort
  if executable('rg')
    execute "AsyncRun! rg -n " . a:string . " * "
    " execute "AsyncRun! -post=copen\ 8 rg -n " . a:string . " * "
  elseif has('win32') || has('win64')
    execute "AsyncRun! -cwd=<root> findstr /n /s /C:" . a:string
  else
    execute "AsyncRun! -cwd=<root> grep -n -s -R " .
      \ a:string . " * " .
      \ "--exclude='*.so' " .
      \ " --exclude='.git' " .
      \ "--exclude='.idea' " .
      \ "--exclude='.cache' " .
      \ "--exclude='.IntelliJIdea' " .
      \ "--exclude='*.py[co]'"
  endif
endfunction
" ShowDoc: show document
function! utils#showdoc() abort
  if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('jumpDefinition')
    endif
endfunction
" ShowMessage: show highlighted message
function! utils#showmsg(message, ...) abort
  if a:0 == 0
    let msg_type = 'more'
  else
    let msg_type = a:1
  endif

  if msg_type == 'more'
    echohl MoreMsg
  elseif msg_type == 'warning'
    echohl WarningMsg
  elseif msg_type == 'error'
    echohl ErrorMsg
  endif

  if type(a:message) != 1
    let message = join(a:message, "\n")
  else
    let message = a:message
  endif

  echo message
  echohl None
endfunction
