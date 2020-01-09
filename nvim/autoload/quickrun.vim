" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

function! quickrun#run() abort
  update
  AsyncStop
  sleep 500m  " wait job to stop
  if exists('b:quickrun_cmd')
    execute b:quickrun_cmd
  elseif &filetype == 'c'
    if has('unix')
      AsyncRun gcc -g % && ./a.out
    else
      AsyncRun gcc -g "$(VIM_FILEPATH)" -o "a.exe" && "$(VIM_FILEDIR)/a.exe"
    endif
  elseif &filetype == 'cpp'
    if has('unix')
      AsyncRun g++ -g % && ./a.out
    else
      AsyncRun g++ -g "$(VIM_FILEPATH)" -o "a.exe" && "$(VIM_FILEDIR)\a.exe"
    endif
  elseif &filetype == 'go'
    AsyncRun go run %
  elseif &filetype == 'html' || &filetype == 'htmldjango'
    call utils#BrowserOpen(expand("%:p"))
  elseif &filetype == 'java'
    AsyncRun javac % && java %:r
  elseif &filetype == 'javascript'
    AsyncRun node %
  elseif &filetype == 'lua'
    AsyncRun lua %
  elseif &filetype == 'markdown'
    MarkdownPreview
  elseif &filetype == 'python'
    if has("unix")
      AsyncRun -raw python3 %
    else
      AsyncRun -raw python "$(VIM_FILEPATH)"
    endif
  elseif &filetype == 'rust'
    AsyncRun cargo run
  elseif &filetype == 'sh'
    AsyncRun bash %
  elseif &filetype == 'tex'
    VimtexCompile
  elseif &filetype == 'typescript'
    AsyncRun tsc %
  elseif &filetype == 'vim'
    source %
  else
    let msg = "Not supported filetype:" . " " . &filetype
    call utils#showmsg(msg, 'warning')
  endif
endfunction

""
" Set quickrun command for a specific buffer
function! quickrun#Setcmd(...) abort
  if a:0 > 0
    let b:quickrun_cmd = a:1
    return
  endif
  echohl Title
  echo "Select and input the number:"
  echohl None
  let cmdlist = [
    \ '----------------------------------------',
    \ '1. Input your own command',
    \ '2. AsyncRun -raw python3 %',
    \ '3. AsyncRun -raw python2 %',
    \ '4. AsyncRun cargo run',
    \ '5. AsyncRun rustc % && ./%:r',
    \ '6. AsyncRun tsc',
    \ '7. AsyncRun tsc --watch',
    \ '8. AsyncRun make',
    \ '9. Codi python'
  \ ]
  let select = inputlist(cmdlist)
  if select == 0
    return
  elseif select == 1
    echohl ModeMsg
    let cmd = input("Input your command: ", "", "shellcmd")
    echohl None
    if trim(cmd) == ""
      return
    endif
    let b:quickrun_cmd = cmd
  elseif select > 0 && select < len(cmdlist)
      let b:quickrun_cmd = cmdlist[select][3:]
  else
    echohl ErrorMsg
    echo "\nInvalid input"
    echohl None
    return
  endif
  echohl Title
  echo "\n\nYour QuickRun command is"
  echohl Preproc
  echo b:quickrun_cmd
  echohl None
endfunction
