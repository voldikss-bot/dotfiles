" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" BrowserOpen:
function! userfunc#utils#BrowserOpen(obj) abort
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

" FileExplore:
function! userfunc#utils#OpenFileExplorer() abort
  let path = expand(getcwd())
  call userfunc#utils#BrowserOpen(path)
endfunction

" Grep:
function! userfunc#utils#Grep(string) abort
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

" TabMessage:
function! userfunc#utils#TabMessage(cmd) abort
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    call userfunc#utils#ShowMsg('No Output', 'warning')
  else
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

" ShowMessage:
function! userfunc#utils#ShowMsg(message, ...) abort
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

" ShowDocument
function! userfunc#utils#ShowDocument() abort
  if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('jumpDefinition')
    endif
endfunction
