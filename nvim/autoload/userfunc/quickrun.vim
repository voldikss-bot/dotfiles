" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" QuickRun:
function! userfunc#quickrun#Run(...) abort
  update
  if g:asyncrun_status ==# 'running'
    AsyncStop
    sleep 500m  " wait job to stop
  endif
  if a:0 > 0
    let b:quickrun_cmd = a:1
  endif
  if exists('b:quickrun_cmd')
    execute b:quickrun_cmd
    return
  elseif &filetype == 'c'
    if has('unix')
      let b:quickrun_cmd = 'AsyncRun gcc -g % && ./a.out'
    else
      let b:quickrun_cmd = 'AsyncRun gcc -g "$(VIM_FILEPATH)" -o "a.exe" && "$(VIM_FILEDIR)/a.exe"'
    endif
  elseif &filetype == 'cpp'
    if has('unix')
      let b:quickrun_cmd = 'AsyncRun g++ -g % && ./a.out'
    else
      let b:quickrun_cmd = 'AsyncRun g++ -g "$(VIM_FILEPATH)" -o "a.exe" && "$(VIM_FILEDIR)\a.exe"'
    endif
  elseif &filetype == 'go'
    let b:quickrun_cmd = 'AsyncRun go run %'
  elseif &filetype == 'html' || &filetype == 'htmldjango'
    let b:quickrun_cmd = 'call userfunc#utils#BrowserOpen(expand("%:p"))'
  elseif &filetype == 'java'
    let b:quickrun_cmd = 'AsyncRun javac % && java %:r'
  elseif &filetype == 'javascript'
    let b:quickrun_cmd = 'AsyncRun node %'
  elseif &filetype == 'lua'
    let b:quickrun_cmd = 'AsyncRun lua %'
  elseif &filetype == 'markdown'
    let b:quickrun_cmd = 'MarkdownPreview'
  elseif &filetype == 'python'
    if has("unix")
      let b:quickrun_cmd = 'AsyncRun -raw -mode=term python3 %'
    else
      let b:quickrun_cmd = 'AsyncRun -raw python "$(VIM_FILEPATH)"'
    endif
  elseif &filetype == 'rust'
    let b:quickrun_cmd = 'AsyncRun -mode=term cargo run'
  elseif &filetype == 'sh'
    let b:quickrun_cmd = 'AsyncRun bash %'
  elseif &filetype == 'tex'
    let b:quickrun_cmd = 'VimtexCompile'
  elseif &filetype == 'typescript'
    let b:quickrun_cmd = 'AsyncRun tsc % && node $(VIM_FILENOEXT).js'
  elseif &filetype == 'vim'
    let b:quickrun_cmd = 'source %'
  else
    let msg = printf("Not supported filetype: %s", &filetype)
    call userfunc#utils#ShowMsg(msg, 'warning')
    return
  endif
  execute b:quickrun_cmd
endfunction

function! userfunc#quickrun#Complete(arg_lead,cmd_line,cursor_pos) abort
  let lst = ['AsyncRun'] + getcompletion('', 'shellcmd')
  let cmd_line_before_cursor = a:cmd_line[:a:cursor_pos - 1]
  let args = split(cmd_line_before_cursor, '\v\\@<!(\\\\)*\zs\s+', 1)
  call remove(args, 0)

  if len(args) ==# 1
    if args[0] ==# ''
      return lst
    else
      let prefix = args[-1]
      let candidates = filter(lst, 'v:val[:len(prefix) - 1] ==# prefix')
      return candidates
    endif
  endif
endfunction
