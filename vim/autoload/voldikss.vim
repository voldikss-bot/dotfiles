" vim:fdm=indent
" ========================================================================
" Description: autoload/util.vim
" Author: voldikss
" GitHub: https://github.com/voldikss/dotfiles
" ========================================================================

" TabMessage: capture command output
function! voldikss#TabMessage(cmd) abort
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    call voldikss#ShowMessage('No Output', 'warning')
  else
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
" BrowserOpen: open file or url
function! voldikss#BrowserOpen(obj) abort
  " windows(mingw)
  if has('win32') || has('win64') || has('win32unix')
    let l:cmd = 'rundll32 url.dll,FileProtocolHandler ' . a:obj
  elseif has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin'
    let l:cmd = 'open ' . a:obj
  elseif executable('xdg-open')
    let l:cmd = 'xdg-open ' . a:obj
  else
    echoerr "No browser found, please contact the developer."
  endif
  exec 'AsyncRun -post=cclose' . ' ' . l:cmd
endfunction
" FileExplore: open cwd in file explore
function! voldikss#OpenFileExplore() abort
  let l:path = expand(getcwd())
  call voldikss#BrowserOpen(l:path)
endfunction
" SetQuickRunCommand: specify quickrun command
function! voldikss#SetQuickRunCmd() abort
  echohl Title
  echo "Select and input the number:"
  echohl None
  let cmd_list = [
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
  let select = inputlist(cmd_list)
  if select == 0
    return
  elseif select == 1
    echohl ModeMsg
    let cmd = input("Input your command: ", "", "shellcmd")
    echohl None
    if trim(cmd) == ""
      return
    endif
    let g:quickrun_command = cmd
  elseif select > 0 && select < len(cmd_list)
      let g:quickrun_command = cmd_list[select][3:]
  else
    echohl ErrorMsg
    echo "\nInvalid input"
    echohl None
    return
  endif
  echohl Title
  echo "\n\nYour QuickRun command is"
  echohl Preproc
  echo g:quickrun_command
  echohl None
endfunction
" QuickRun: one key to run
function! voldikss#QuickRun() abort
  update
  AsyncStop
  sleep 500m  " wait job to stop
  if exists('g:quickrun_command')
    execute g:quickrun_command
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
    call voldikss#browserOpen(expand("%:p"))
    BLReloadPage
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
    echohl WarningMsg
    echo "Not supported filetype:" . " " . &filetype
    echohl None
  endif
endfunction
" Autoformat: format code
function! voldikss#AutoFormat() abort
  let curr_pos = getpos('.')
  " 1. use coc
  call CocAction('format')
  " 2. remove whitespace
  call voldikss#RemoveWhiteSpeces()
  " 3. remove blank lines
  call voldikss#RemoveBlankLines()
  if expand('%') != ''
    update
  endif
  call setpos('.', curr_pos)
endfunction
" RemoveBlankLines:
function! voldikss#RemoveBlankLines() abort
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
function! voldikss#RemoveWhiteSpeces()
  silent! execute '%s/\s\+$//g'
endfunction
" AutoSaveBuffer:
function! voldikss#AutoSave() abort
  let curr_pos = getpos('.')
  if getpos('.')[1] != line('$')
    call voldikss#RemoveBlankLines()
  endif
  if trim(getline('.')) != ''
    call voldikss#RemoveWhiteSpeces()
  endif
  if expand('%') != '' | update | endif
  " TODO
  " if index(['html', 'htmldjango', 'css'], &filetype) >= 0
  "   BLReloadPage
  " endif
  call setpos('.', curr_pos)
endfunction
" ToggleWindows:
function! voldikss#ToggleWindows(winname) abort
  let found_winnr = 0

  for winnr in range(1, winnr('$'))
    let buftype = getbufvar(winbufnr(winnr), '&buftype')
    let filetype = getbufvar(winbufnr(winnr), '&filetype')
    " terminal window: &buftype is 'terminal' but &filetype is ''
    let window = filetype != "" ? filetype : buftype
    if window == a:winname
      let found_winnr = winnr
    " close other windows
    elseif g:only_one_win
      if index(keys(g:windows_toggle), window) >= 0
        execute g:windows_toggle[window]['close']
      elseif index(['leaderf'], window) >=0
        execute winnr . 'wincmd q'
      endif
    endif
  endfor

  if found_winnr > 0
    " close or go to that window(for example, terminal...)
    execute g:windows_toggle[a:winname]['close']
  else
    " open a new window or open that background buffer
    execute g:windows_toggle[a:winname]['open']
  endif
endfunction
" Random:
function! voldikss#Random(max) abort
  if has("reltime")
    let l:timerstr=reltimestr(reltime())
    let l:number=split(l:timerstr, '\.')[1]+0
  elseif has("win32") && &shell =~ 'cmd'
    let l:number=system("echo %random%")+0
  else
    " best effort, bash and zsh provide $RANDOM
    " cmd.exe on windows provides %random%, but expand()
    " does not seem to be able to expand this correctly.
    " In the worst case, this always returns zero
    let l:number=expand("$RANDOM")+0
  endif
  return l:number % a:max
endfunction
" Grep:
function! voldikss#Grep(string) abort
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
" VisualStarSearch:
function! voldikss#VisualStarSearchSet(cmdtype, ...) abort
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
" ShowDoc: show document
function! voldikss#ShowDocumentation() abort
  if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('jumpDefinition')
    endif
endfunction
" ShowMessage: show highlighted message
function! voldikss#ShowMessage(message, ...) abort
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
