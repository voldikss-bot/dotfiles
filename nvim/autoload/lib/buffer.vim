" ============================================================================
" FileName: buffer.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

let s:exclude_filetypes = ['floaterm', 'coc-explorer', 'vista']

" CloseNoDisplayedBuffers: Close buffers which are not opened in window
function! lib#buffer#CloseNoDisplayedBuffers() abort
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor

  let tally = 0
  for b in range(1, bufnr('$'))
    if index(s:exclude_filetypes, getbufvar(b, '&filetype')) > -1
      continue
    endif
    if bufexists(b) && !has_key(visible, b)
      try
        execute 'bwipeout' b
        let tally += 1
      catch
      endtry
    endif
  endfor
  echom 'Closed ' . tally . ' Files'
endfunction

" CloseNoCurrentBuffers: Close other buffers
function! lib#buffer#CloseNoCurrentBuffers() abort
  let tally = 0
  for b in range(1, bufnr('$'))
    if index(s:exclude_filetypes, getbufvar(b, '&filetype')) > -1
      continue
    endif
    if bufexists(b) && b != bufnr('%')
      try
        execute 'bwipeout' b
        let tally += 1
      catch
      endtry
    endif
  endfor
  echom 'Closed ' . tally . ' Files'
endfunction

" CloseNoBuflistedBuffers: Close buffers which is nobuflisted
function! lib#buffer#CloseNoBuflistedBuffers() abort
  let tally = 0
  for b in range(1, bufnr('$'))
    if index(s:exclude_filetypes, getbufvar(b, '&filetype')) > -1
      continue
    endif
    if !buflisted(b)
      try
        execute 'bwipeout' b
        let tally += 1
      catch
      endtry
    endif
  endfor
  echom 'Closed ' . tally . ' Files'
endfunction
