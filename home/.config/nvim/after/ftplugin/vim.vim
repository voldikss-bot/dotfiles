setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal commentstring=\"\ %s
setlocal foldmethod=indent
setlocal nospell

" For userfunc#keymap#Square_Brackets_Left and userfunc#keymap#Square_Brackets_Right
" solve conflicts with runtime/ftplugin/vim.vim line71
unmap <buffer> ]]
unmap <buffer> [[

" coc-pairs
let b:coc_pairs_disabled = ['"']

" vim-argwrap
let b:argwrap_line_prefix = '\'
let b:argwrap_tail_indent_braces = '('
