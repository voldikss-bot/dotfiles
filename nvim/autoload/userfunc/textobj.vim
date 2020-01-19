" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

function! userfunc#textobj#url() abort
  let regex = '\c\<\(\%([a-z][0-9A-Za-z_-]\+:\%(\/\{1,3}\|[a-z0-9%]\)\|www\d\{0,3}[.]\|[a-z0-9.\-]\+[.][a-z]\{2,4}\/\)\%([^ \t()<>]\+\|(\([^ \t()<>]\+\|\(([^ \t()<>]\+)\)\)*)\)\+\%((\([^ \t()<>]\+\|\(([^ \t()<>]\+)\)\)*)\|[^ \t`!()[\]{};:'."'".'".,<>?«»“”‘’]\)\)'
  let lnum = getpos('.')[1]
  let line = getline(lnum)
  let [str, start, end] = matchstrpos(line, regex)
  if str !=# ''
    call cursor(lnum, start+1)
    normal v
    call cursor(lnum, end)
  endif
endfunction
