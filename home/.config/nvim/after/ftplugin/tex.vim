setlocal shiftwidth=2
setlocal nospell

" coc-pairs
let b:coc_pairs = extend([['$', '$']], g:coc_pairs_expand)

setlocal textwidth=82
setlocal formatoptions=jmBtl

let b:match_words = '\<begin\>:\<end\>'
