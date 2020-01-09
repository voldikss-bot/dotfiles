setlocal foldmethod=indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal commentstring=//\ %s
setlocal nospell
let b:coc_pairs = extend([['/*', '*/']], g:coc_pairs_expand)
