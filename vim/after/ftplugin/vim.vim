" for .vimrc
if expand('%:t')=='vimrc'
    setlocal foldmethod=marker
    setlocal foldmarker=[[[,]]]
else
    setlocal foldmethod=indent
endif
setlocal shiftwidth=2
