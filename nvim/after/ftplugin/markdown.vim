setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
iabbrev <buffer> i I

setlocal spell
setlocal spelllang=en_us

" coc-pairs
let b:coc_pairs = extend([['*', '*']], g:coc_pairs_expand)
