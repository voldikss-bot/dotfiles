" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

function! s:textobj(pattern) abort
  let lnum = getpos('.')[1]
  let line = getline(lnum)
  let [str, start, end] = matchstrpos(line, a:pattern)
  if str !=# ''
    call cursor(lnum, start+1)
    normal v
    call cursor(lnum, end)
  endif
endfunction

function! userfunc#textobj#url() abort
    let pattern = '\(http\|https\|ftp\)://[a-zA-Z0-9][a-zA-Z0-9_-]*\(\.[a-zA-Z0-9][a-zA-Z0-9_-]*\)*\(:\d\+\)\?\(/[a-zA-Z0-9_/.\-+%?&=;@$,!''*~]*\)\?\(#[a-zA-Z0-9_/.\-+%#?&=;@$,!''*~]*\)\?'
  call s:textobj(pattern)
endfunction

function! userfunc#textobj#ip() abort
  " pattern from https://github.com/deris/vim-textobj-ipmac/blob/master/plugin/textobj/ipmac.vim
  let pattern =
    \ '\%(\%(\%('
    \ .'[[:xdigit:]]\{1,4}\%(:[[:xdigit:]]\{1,4}\)\{5}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{4}\%(:[[:xdigit:]]\{1,4}\)\{1}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{3}\%(:[[:xdigit:]]\{1,4}\)\{1,2}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{2}\%(:[[:xdigit:]]\{1,4}\)\{1,3}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{1}\%(:[[:xdigit:]]\{1,4}\)\{1,4}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{1,5}'
    \ .'\|:\%(:[[:xdigit:]]\{1,4}\)\{1,5}'
    \ .'\|:'
    \ .'\):\%(25[0-5]\|2[0-4]\d\|1\d\{2}\|[1-9]\?\d\)\%(\.\%(25[0-5]\|2[0-4]\d\|1\d\{2}\|[1-9]\?\d\)\)\{3}'
    \ .'\|\%('
    \ .'[[:xdigit:]]\{1,4}\%(:[[:xdigit:]]\{1,4}\)\{7}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{6}\%(:[[:xdigit:]]\{1,4}\)\{1}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{5}\%(:[[:xdigit:]]\{1,4}\)\{1,2}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{4}\%(:[[:xdigit:]]\{1,4}\)\{1,3}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{3}\%(:[[:xdigit:]]\{1,4}\)\{1,4}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{2}\%(:[[:xdigit:]]\{1,4}\)\{1,5}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{1}\%(:[[:xdigit:]]\{1,4}\)\{1,6}'
    \ .'\|\%([[:xdigit:]]\{1,4}:\)\{1,7}:'
    \ .'\|:\%(:[[:xdigit:]]\{1,4}\)\{1,7}'
    \ .'\|::'
    \ .'\)'
    \ .'\)'
    \ .'\|\%(25[0-5]\|2[0-4]\d\|1\d\{2}\|[1-9]\?\d\)\%(\.\%(25[0-5]\|2[0-4]\d\|1\d\{2}\|[1-9]\?\d\)\)\{3}'
    \ .'\|[[:xdigit:]]\{2}\%(:[[:xdigit:]]\{2}\)\{5}'
    \ .'\)'
  call s:textobj(pattern)
endfunction
