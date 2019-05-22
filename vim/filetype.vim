" my filetype file
if exists("did_load_my_filetypes")
    finish
endif

augroup filetypedetect

	autocmd BufNewFile,BufRead  .tern-project     setfiletype json
	autocmd BufNewFile,BufRead  .jsbeautifyrc     setfiletype json
	autocmd BufNewFile,BufRead  .eslintrc         setfiletype json
	autocmd BufNewFile,BufRead  .jscsrc           setfiletype json

    autocmd BufNewFile,BufRead  *.cjson           setfiletype jsonc
    autocmd BufNewFile,BufRead  coc-settings.json setfiletype jsonc

    autocmd BufNewFile,BufRead  *.wl              setfiletype mma
    autocmd BufNewFile,BufRead  *.wls             setfiletype mma
    autocmd BufNewFile,BufRead  *.gitignore       setfiletype gitignore

    autocmd BufNewFile,BufRead *.lmp              setfiletype lammps
    autocmd BufNewFile,BufRead *.lammps           setfiletype lammps
    autocmd BufNewFile,BufRead in.*               setfiletype lammps

augroup END

let did_load__my_filetypes=1
