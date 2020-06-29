" ============================================================================
" FileName: command.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

command! -nargs=0 AutoFormat call userfunc#file#AutoFormat()
command! -nargs=0 OpenFileExplorer call userfunc#utils#OpenFileExplorer()
command! -nargs=0 CloseNoBuflistedBuffers call userfunc#buffer#CloseNoBuflistedBuffers()
command! -nargs=0 CloseNoCurrentBuffers call userfunc#buffer#CloseNoCurrentBuffers()
command! -nargs=0 CloseNoDisplayedBuffers call userfunc#buffer#CloseNoDisplayedBuffers()
command! -nargs=* Zeal call userfunc#utils#Zeal(<q-args>)
command! -nargs=? Bline call userfunc#utils#DelimiterLine('bold', <f-args>)
command! -nargs=? Cline call userfunc#utils#DelimiterLine('comment', <f-args>)
command! -nargs=? Line call userfunc#utils#DelimiterLine('light', <f-args>)
command! -nargs=? RenameFile call userfunc#file#Rename(<q-args>)
command! -nargs=? RemoveFile call userfunc#file#Remove()
command! -nargs=* SyntaxAt call userfunc#utils#SyntaxAt(<f-args>)
command! -nargs=+ Grep  call userfunc#utils#Grep(<q-args>)
command! -nargs=+ -complete=file  BrowserOpen  call userfunc#utils#BrowserOpen(<q-args>)
command! -nargs=+ -complete=command  TabMessage call userfunc#utils#TabMessage(<q-args>)
command! -nargs=? -complete=customlist,userfunc#quickrun#Complete QuickRun call userfunc#quickrun#Run(<f-args>)
command! -nargs=+ -complete=customlist,userfunc#window#Complete SwitchWindow call userfunc#window#SwitchWindow(<q-args>)
command! -nargs=0 YarnWatch call floaterm#new(0, 'yarn watch', {}, {
  \ 'on_stdout': function('userfunc#floaterm#WatchCallback'),
  \ 'on_stderr': function('userfunc#floaterm#WatchCallback'),
  \ 'on_exit': function('userfunc#floaterm#WatchCallback')
  \ })
