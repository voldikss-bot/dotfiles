" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

let g:winmgr_only_one_win = 1
let s:winmgr_windows = {
  \ 'coc-explorer': {
    \ 'open': 'CocCommand explorer',
    \ 'close': 'CocCommand explorer'
  \ },
  \ 'vista': {
    \ 'open':'Vista',
    \ 'close': 'Vista!'
  \ },
  \ 'quickfix': {
    \ 'open': 'copen 9',
    \ 'close': 'cclose'
  \ },
  \ 'mundo': {
    \ 'open': 'MundoToggle',
    \ 'close': 'MundoToggle'
  \ },
  \ 'terminal': {
    \ 'open': 'FloatermToggle',
    \ 'close': 'FloatermToggle'
  \ }
\ }

function! userfunc#window#SwitchWindow(winname) abort
  let found_winnr = 0
  for winnr in range(1, winnr('$'))
    let buftype = getbufvar(winbufnr(winnr), '&buftype')
    let filetype = getbufvar(winbufnr(winnr), '&filetype')
    " terminal window: &buftype is 'terminal' but &filetype is ''
    let window = filetype != "" ? filetype : buftype
    if window == a:winname
      let found_winnr = winnr
    " close other windows
    elseif g:winmgr_only_one_win
      if index(keys(s:winmgr_windows), window) >= 0
        execute s:winmgr_windows[window]['close']
      elseif index(['leaderf'], window) >=0
        execute winnr . 'wincmd q'
      endif
    endif
  endfor
  if found_winnr > 0
    " close or go to that window(for example, terminal...)
    execute s:winmgr_windows[a:winname]['close']
  else
    " open a new window or open that background buffer
    execute s:winmgr_windows[a:winname]['open']
  endif
endfunction

function! userfunc#window#Complete(...) abort
  return keys(s:winmgr_windows)
endfunction
