" vim:fdm=indent
" ========================================================================
" Description: autoload/util.vim
" Author: voldikss
" GitHub: https://github.com/voldikss/dotfiles
" ========================================================================

" TabMessage: capture command output
function! util#tabMessage(cmd) abort
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    call util#showMessage('No Output', 'warning')
  else
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
" BrowserOpen: open file or url
function! util#browserOpen(obj) abort
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
function! util#openFileExplore() abort
  let l:path = expand(getcwd())
  call util#browserOpen(l:path)
endfunction
" SetQuickRunCommand: specify quickrun command
function! util#setQuickRunCmd() abort
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
function! util#quickRun() abort
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
    call util#browserOpen(expand("%:p"))
    BLReloadPage
  elseif &filetype == 'java'
    AsyncRun javac % && java %:r
  elseif &filetype == 'javascript'
    AsyncRun node %
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
function! util#autoFormat() abort
  if expand('%') == ''
    call util#showMessage('No File Name', 'warning')
    return
  endif
  let curr_pos = getpos('.')
  silent! execute '%s/\s\+$//g'
  call CocAction('format')
  update
  call setpos('.', curr_pos)
endfunction
" AutoSaveBuffer:
function! util#autoSave() abort
  if expand('%') != '' | update | endif
  " TODO
  " if index(['html', 'htmldjango', 'css'], &filetype) >= 0
  "   BLReloadPage
  " endif
endfunction
" ToggleWindows:
function! util#toggleWindows(winname) abort
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
function! util#randNum(max) abort
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
function! util#grep(string) abort
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
" DefxMySettings:
function! util#defxSettings() abort
  setlocal nonumber
  setlocal listchars=
  setlocal foldcolumn=0
  setlocal noswapfile
  setlocal nolist
  setlocal nospell
  setlocal cursorline
  setlocal signcolumn=no
  setlocal winblend=20

  " Define mappings
  nnoremap <silent><buffer><expr><nowait>   <CR>            defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('multi', ['drop'])
  nnoremap <silent><buffer><expr><nowait>   <2-LeftMouse>   defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('multi', ['drop'])
  nnoremap <silent><buffer><expr><nowait>   c               defx#do_action('copy')
  nnoremap <silent><buffer><expr><nowait>   m               defx#do_action('move')
  nnoremap <silent><buffer><expr><nowait>   p               defx#do_action('paste')
  nnoremap <silent><buffer><expr><nowait>   l               defx#do_action('open')
  nnoremap <silent><buffer><expr><nowait>   E               defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr><nowait>   P               defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr><nowait>   o               defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr><nowait>   D               defx#do_action('new_directory')
  nnoremap <silent><buffer><expr><nowait>   N               defx#do_action('new_file')
  nnoremap <silent><buffer><expr><nowait>   M               defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr><nowait>   C               defx#do_action('toggle_columns', 'mark:git:icons:filename:size:time')
  nnoremap <silent><buffer><expr><nowait>   S               defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr><nowait>   d               defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr><nowait>   r               defx#do_action('rename')
  nnoremap <silent><buffer><expr><nowait>   !               defx#do_action('execute_command')
  nnoremap <silent><buffer><expr><nowait>   x               defx#do_action('execute_system')
  nnoremap <silent><buffer><expr><nowait>   y               defx#do_action('yank_path')
  nnoremap <silent><buffer><expr><nowait>   I               defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr><nowait>   .               defx#do_action('repeat')
  nnoremap <silent><buffer><expr><nowait>   h               defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr><nowait>   q               defx#do_action('quit')
  nnoremap <silent><buffer><expr><nowait>   <Esc>           defx#do_action('quit')
  nnoremap <silent><buffer><expr><nowait>   <Space>         defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr><nowait>   *               defx#do_action('toggle_select_all')
  nmap     <buffer><silent>                 gk              <Plug>(defx-git-prev)
  nmap     <buffer><silent>                 gj              <Plug>(defx-git-next)
  " nnoremap <silent><buffer><expr><nowait>   j               line('.') == line('$') ? 'gg' : 'j'
  " nnoremap <silent><buffer><expr><nowait>   k               line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr><nowait>   f               defx#do_action('redraw')
endfunction
" VisualStarSearch:
function! util#visualStarSearchSet(cmdtype, ...) abort
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
function! util#showDoc() abort
  if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('jumpDefinition')
    endif
endfunction
" ToggleCoc: disable coc.nvim for large file
function! util#toggleCoc() abort
  let g:trigger_size = get(g:, 'trigger_size', 0.5 * 1048576)
  let size = getfsize(expand('<afile>'))
  if (size > g:trigger_size) || (size == -2)
    echohl WarningMsg
    echomsg 'Coc.nvim was disabled for this large file'
    echohl None
    exec 'CocDisable'
  else
    exec 'CocEnable'
  endif
endfunction
" ShowMessage: show highlighted message
function! util#showMessage(message, ...)
  if a:0 == 0
    let msgType = 'more'
  else
    let msgType = a:1
  endif

  if msgType == 'more'
    echohl MoreMsg
  elseif msgType == 'warning'
    echohl WarningMsg
  elseif msgType == 'error'
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
