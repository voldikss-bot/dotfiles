" vim:fdm=marker:fmr=[[[,]]]
" ========================================================================
" Description: autoload/util.vim
" Author: voldikss
" GitHub: https://github.com/voldikss/dotfiles
" ========================================================================

" TabMessage: capture command output [[[1
function! util#tabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
" BrowserOpen: open file or url [[[1
function! util#browserOpen(obj)
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
" FileExplore: open cwd in file explore [[[1
function! util#openFileExplore()
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
" QuickRun: one key to run [[[1
function! util#quickRun()
    exec 'w'
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
        echo "Not supported filetype:" . " " . &filetype
    endif
endfunction
" Autoformat: format code [[[1
function! util#autoFormat()
    let curr_pos = getpos('.')
    silent! execute '%s/\s\+$//g'
    call CocAction('format')
    update
    call setpos('.', curr_pos)
endfunction
" AutoSaveBuffer: [[[2
function! util#autoSave()
    update
    if index(['html', 'htmldjango', 'css'], &filetype) >= 0
        BLReloadPage
    endif
endfunction
" ToggleWindows: [[[1
function! util#toggleWindows(winname)
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
" ToggleTerminal: [[[1
function! util#toggleTerminal(height, width)
  let found_winnr = 0
  for winnr in range(1, winnr('$'))
    if getbufvar(winbufnr(winnr), '&buftype') == 'terminal'
      let found_winnr = winnr
    endif
  endfor

  if found_winnr > 0
    if &buftype == 'terminal'
        " if current window is the terminal window, close it
        execute found_winnr . ' wincmd q'
    else
        " if current window is not terminal, go to the terminal window
        execute found_winnr . ' wincmd w'
    endif
  else
    let found_bufnr = 0
    for bufnr in filter(range(1, bufnr('$')), 'bufexists(v:val)')
      let buftype = getbufvar(bufnr, '&buftype')
      if buftype == 'terminal'
        let found_bufnr = bufnr
      endif
    endfor

    if g:terminal_type == 'floating'
      call s:openTermFloating(found_bufnr, a:height, a:width)
    else
      call s:openTermNormal(found_bufnr, a:height, a:width)
    endif
  endif
endfunction
function! s:openTermFloating(found_bufnr, height, width) abort
  let [row, col, vert, hor] = s:getWinPos(a:width, a:height)
  let opts = {
    \ 'relative': 'cursor',
    \ 'width': a:width,
    \ 'height': a:height,
    \ 'col': col,
    \ 'row': row,
    \ 'anchor': vert . hor,
    \ 'style': 'minimal'
  \ }

  if a:found_bufnr == 0
    let bufnr = nvim_create_buf(v:false, v:true)
    call nvim_open_win(bufnr, 1, opts)
    terminal
    autocmd TermClose <buffer> if &buftype=='terminal' | wincmd c | endif
  else
    call nvim_open_win(a:found_bufnr, 1, opts)
  endif

  setlocal winblend=30
  setlocal foldcolumn=1
  setlocal bufhidden=hide
  setlocal signcolumn=no
  setlocal nobuflisted
  setlocal nocursorline
  setlocal nonumber
  setlocal norelativenumber
endfunction
function! s:openTermNormal(found_bufnr, height, width)
  if a:found_bufnr > 0
    if &lines > 30
      execute 'botright ' . a:height . 'split'
      execute 'buffer ' . a:found_bufnr
    else
      botright split
      execute 'buffer ' . a:found_bufnr
    endif
  else
    if &lines > 30
      if has('nvim')
        execute 'botright ' . a:height . 'split term://' . &shell
      else
        botright terminal
        resize a:height
      endif
    else
      if has('nvim')
        execute 'botright split term://' . &shell
      else
        botright terminal
      endif
    endif
  endif
endfunction
function! s:getWinPos(width, height) abort
    let bottom_line = line('w0') + winheight(0) - 1
    let curr_pos = getpos('.')
    let rownr = curr_pos[1]
    let colnr = curr_pos[2]
    " a long wrap line
    if colnr > &columns
        let colnr = colnr % &columns
        let rownr += colnr / &columns
    endif

    if rownr + a:height <= bottom_line
        let vert = 'N'
        let row = 1
    else
        let vert = 'S'
        let row = 0
    endif

    if colnr + a:width <= &columns
        let hor = 'W'
        let col = 0
    else
        let hor = 'E'
        let col = 1
    endif

    return [row, col, vert, hor]
endfunction
" NormalMapForEnter: <CR> [[[1
function! util#normalMapForCR()
    if &filetype ==# 'quickfix'
        return "\<CR>"
    else
        let line = trim(getline('.'))
        if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
            if line != ''
                \ && index(['#', '/'], line[0]) < 0
                \ && index([';', '{','[', '(', '\'], line[-1:]) < 0
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
" InsertMapForEnter: <CR> [[[1
function! util#insertMapForCR()
    let line = getline('.') " can not use trim
    if pumvisible()
        return "\<C-y>"
    elseif index([')', ']', '}'], strcharpart(line, getpos('.')[2]-1, 1)) >= 0
        return "\<CR>\<Esc>O"
    elseif strcharpart(line, getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction
" InsertMapForSemicolonEnter: ;<CR> [[[1
function! util#insertMapForSemicolonCR()
    let line = trim(getline('.'))
    if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
        if line != '' && line[-1:] != ';' && index(['#', '/'], line[0]) < 0
            return "\<End>;\<CR>"
        else
            return "\<Esc>o"
        endif
    elseif index(['json', 'jsonc'], &filetype) >=0
        if line != ''
            \ && index(['#', '/'], line[0]) < 0
            \ && index([',', '{','['], line[-1:]) < 0
            return "\<End>,\<CR>"
        else
            return "\<Esc>o"
        endif
    else
        return "\<Esc>o"
    endif
endfunction
" InsertMapForSemicolonP: ;p [[[1
function! util#insertMapForSemicolonP()
    if &filetype == 'python'
        let line = trim(getline('.'))
        if line != '' && line[-1:] != ':'
            return "\<End>:\<CR>"
        else
            return ""
        endif
    else
        return "\<End>\<Space>{}\<Left>\<CR>\<Esc>O"
    endif
endfunction
" InsertMapForDoubleSemicolon: ;; [[[1
function! util#insertMapForDoubleSemicolon()
    let line = trim(getline('.'))
    if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
        if line != '' && line[-1:] != ';' && index(['#', '/'], line[0]) < 0
            return "\<End>;"
        else
            return ""
        endif
    elseif &filetype == 'python'
        if trim(line) != '' && line[-1:] != ':'
            return "\<End>:"
        else
            return ""
        endif
    elseif index(['json', 'jsonc'], &filetype)
        if trim(line) != '' && line[-1:] != ','
            return "\<End>,"
        else
            return ""
        endif
    else
        return ""
    endif
endfunction
" MapForBackspace: <BS> [[[1
function! util#insertMapForBS()
    if col('.') == 1
        if line('.')  != 1
            return  "\<ESC>kA\<Del>"
        else
            return ""
        endif
    else
        let line = getline('.')         " 此处不能用 trim()
        let paren = strcharpart(line, getpos('.')[2]-2, 2)
        if index(['()', '[]', '{}', '<>', '%%', '$$', '**', '""', "''", '~~', '``'], paren) >=0
            return "\<Left>\<Del>\<Del>"
        else
            return "\<Left>\<Del>"
        endif
    endif
endfunction
" Random: [[[1
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
" Grep: [[[1
function! util#grep(string)
    if executable('rg')
        execute "AsyncRun! rg -n " . a:string . " * "
        " execute "AsyncRun! -post=copen\ 8 rg -n " . a:string . " * "
    elseif has('win32') || has('win64')
        execute "AsyncRun! -cwd=<root> findstr /n /s /C:" . a:string
    else
        execute "AsyncRun! -cwd=<root> grep -n -s -R " . a:string . " * " . "--exclude='*.so' --exclude='.git' --exclude='.idea' --exclude='.cache' --exclude='.IntelliJIdea' --exclude='*.py[co]'"
    endif
endfunction
" DefxMySettings: [[[1
function! util#defxSettings() abort
  setlocal nonumber
  setlocal listchars=
  setlocal foldcolumn=0
  setlocal noswapfile
  setlocal nolist
  setlocal nospell
  setlocal cursorline
  setlocal signcolumn=no

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
  nnoremap <silent><buffer><expr><nowait>   y              defx#do_action('yank_path')
  nnoremap <silent><buffer><expr><nowait>   I               defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr><nowait>   .               defx#do_action('repeat')
  nnoremap <silent><buffer><expr><nowait>   h           defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr><nowait>   q               defx#do_action('quit')
  nnoremap <silent><buffer><expr><nowait>   <Space>         defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr><nowait>   *               defx#do_action('toggle_select_all')
  " nnoremap <silent><buffer><expr><nowait>   j               line('.') == line('$') ? 'gg' : 'j'
  " nnoremap <silent><buffer><expr><nowait>   k               line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr><nowait>   f           defx#do_action('redraw')
endfunction
