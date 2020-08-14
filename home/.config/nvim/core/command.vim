" ============================================================================
" FileName: command.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

command! -nargs=0 AutoFormat call lib#file#AutoFormat()
command! -nargs=0 OpenFileExplorer call lib#utils#OpenFileExplorer()
command! -nargs=? RenameFile call lib#file#Rename(<q-args>)
command! -nargs=? RemoveFile call lib#file#Remove()
