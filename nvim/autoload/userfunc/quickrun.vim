" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" QuickRun:
function! userfunc#quickrun#Run(...) abort
  update
  AsyncStop
  sleep 500m  " wait job to stop
  if a:0 > 0
    let b:quickrun_cmd = a:1
  endif
  if exists('b:quickrun_cmd')
    execute 'AsyncRun ' . b:quickrun_cmd
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
    call userfunc#utils#BrowserOpen(expand("%:p"))
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
    AsyncRun tsc % && node $(VIM_FILENOEXT).js
  elseif &filetype == 'vim'
    source %
  else
    let msg = "Not supported filetype:" . " " . &filetype
    call userfunc#utils#ShowMsg(msg, 'warning')
  endif
endfunction
