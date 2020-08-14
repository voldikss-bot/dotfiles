" ============================================================================
" FileName: command.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

command! -nargs=0 AutoFormat call lib#file#AutoFormat()
command! -nargs=0 OpenFileExplorer call lib#utils#OpenFileExplorer()
command! -nargs=0 CloseNoBuflistedBuffers call lib#buffer#CloseNoBuflistedBuffers()
command! -nargs=0 CloseNoCurrentBuffers call lib#buffer#CloseNoCurrentBuffers()
command! -nargs=0 CloseNoDisplayedBuffers call lib#buffer#CloseNoDisplayedBuffers()
command! -nargs=* Zeal call lib#utils#Zeal(<q-args>)
command! -nargs=? Bline call lib#utils#DelimiterLine('bold', <f-args>)
command! -nargs=? Cline call lib#utils#DelimiterLine('comment', <f-args>)
command! -nargs=? Line call lib#utils#DelimiterLine('light', <f-args>)
command! -nargs=? RenameFile call lib#file#Rename(<q-args>)
command! -nargs=? RemoveFile call lib#file#Remove()
command! -nargs=* SyntaxAt call lib#utils#SyntaxAt(<f-args>)
command! -nargs=+ Grep  call lib#utils#Grep(<q-args>)
command! -nargs=+ -complete=file  BrowserOpen  call lib#utils#BrowserOpen(<q-args>)
command! -nargs=+ -complete=command  TabMessage call lib#utils#TabMessage(<q-args>)
command! -nargs=? -complete=customlist,lib#quickrun#Complete QuickRun call lib#quickrun#Run(<f-args>)
command! -nargs=+ -complete=customlist,lib#window#Complete SwitchWindow call lib#window#SwitchWindow(<q-args>)
command! -nargs=0 YarnWatch call floaterm#new(0, 'yarn watch', {}, {
  \ 'on_stdout': function('lib#floaterm#WatchCallback'),
  \ 'on_stderr': function('lib#floaterm#WatchCallback'),
  \ 'on_exit': function('lib#floaterm#WatchCallback')
  \ })
