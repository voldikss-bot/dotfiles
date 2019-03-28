" my filetype file
if exists("did_load_my_filetypes")
    finish
endif

augroup filetypedetect

	autocmd BufNewFile,BufRead .tern-project setfiletype json
	autocmd BufNewFile,BufRead .jsbeautifyrc setfiletype json
	autocmd BufNewFile,BufRead .eslintrc     setfiletype json
	autocmd BufNewFile,BufRead .jscsrc       setfiletype json

    autocmd BufNewFile,BufRead *.wl          setfiletype mma
    autocmd BufNewFile,BufRead *.wls         setfiletype mma
    autocmd BufNewFile,BufRead .gitignore    setfiletype gitignore

    " to prevent vim-polyglot to setting *.js to type javascript.jsx
    autocmd BufNewFile,BufRead *.js          setfiletype javascript

augroup END

let did_load__my_filetypes=1
