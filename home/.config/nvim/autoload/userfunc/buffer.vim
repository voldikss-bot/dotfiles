" ============================================================================
" FileName: buffer.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" CloseNoDisplayedBuffers: Close buffers which are not opened in window
function! userfunc#buffer#CloseNoDisplayedBuffers() abort
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor

  let tally = 0
  for b in range(1, bufnr('$'))
    if getbufvar(b, '&filetype') == 'floaterm'
      continue
    endif
    if bufexists(b) && !has_key(visible, b)
      execute 'bwipeout' b
      let tally += 1
    endif
  endfor
  echom 'Closed ' . tally . ' Files'
endfunction

" CloseNoCurrentBuffers: Close other buffers
function! userfunc#buffer#CloseNoCurrentBuffers() abort
  let tally = 0
  for b in range(1, bufnr('$'))
    if getbufvar(b, '&filetype') == 'floaterm'
      continue
    endif
    if bufexists(b) && b != bufnr('%')
      execute 'bwipeout' b
      let tally += 1
    endif
  endfor
  echom 'Closed ' . tally . ' Files'
endfunction

" CloseNoBuflistedBuffers: Close buffers which is nobuflisted
function! userfunc#buffer#CloseNoBuflistedBuffers() abort
  let tally = 0
  for b in range(1, bufnr('$'))
    if getbufvar(b, '&filetype') == 'floaterm'
      continue
    endif
    if !buflisted(b)
      execute 'bwipeout' b
      let tally += 1
    endif
  endfor
  echom 'Closed ' . tally . ' Files'
endfunction
