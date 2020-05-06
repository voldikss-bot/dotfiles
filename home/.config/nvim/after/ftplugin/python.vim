setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal foldmethod=indent
setlocal commentstring=#\ %s
setlocal nospell

let b:match_words = '\<def\>:\<return\>'
let b:match_words .= ',\<if\>:\<elif\>:\<else\>'
let b:match_words .= ',\<try\>:\<except\>:\<finally\>'
