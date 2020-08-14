" ============================================================================
" FileName: utils.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" OpenFileExplore:
function! lib#utils#OpenFileExplorer() abort
  let path = expand(getcwd())
  if has('win32') || has('win64') || has('win32unix')
    let cmd = 'rundll32 url.dll,FileProtocolHandler ' . path
  elseif has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin'
    let cmd = 'open ' . path
  elseif executable('xdg-open')
    let cmd = 'xdg-open ' . path
  else
    echoerr "No browser found, please contact the developer."
  endif
  exec 'AsyncRun -silent' . ' ' . cmd
endfunction
