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
  exec 'AsyncRun -silent' . ' ' . cmd
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

" ShowDocument:
function! userfunc#utils#ShowDocument() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('jumpDefinition')
  endif
endfunction

" GoToDefinition
function! userfunc#utils#GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif
  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

" SyntaxAt:
function! userfunc#utils#SyntaxAt(...)
  syntax sync fromstart
  if a:0 < 2
    let l:pos = getpos('.')
    let l:cur_lnum = pos[1]
    let l:cur_col = pos[2]
    if a:0 == 0
      let l:lnum = l:cur_lnum
      let l:col = l:cur_col
    else
      let l:lnum = l:cur_lnum
      let l:col = a:1
    endif
  else
    let l:lnum = a:1
    let l:col = a:2
  endif
  call map(synstack(l:lnum, l:col), 'synIDattr(v:val, "name")')
  echom synIDattr(synID(l:lnum, l:col, 1), 'name')
endfunction

" DelimiterLine:
function! userfunc#utils#DelimiterLine(style, ...) abort
  if a:0 > 0
    let count = a:1
  else
    let count = 78
  endif
  let commenthead = &commentstring[:-4]
  if a:style == 'light'
    let line = commenthead . repeat('-', count - len(commenthead))
  elseif a:style == 'bold'
    let line = commenthead . repeat('=', count - len(commenthead))
  elseif a:style == 'comment'
    let line = repeat(&commentstring[0], count)
  endif
  call append(line('.'), line)
endfunction
