" ============================================================================
" FileName: autocmd.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" 退出插入模式或者窗口失去焦点，自动写入保存
augroup UserAutoSaveBuffer
  autocmd!
  autocmd FocusLost,InsertLeave * call lib#file#AutoSave()
augroup END

" 根据所在模式自动切换相对行号和绝对行号
augroup UserLineNumber
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" 打开文件时跳转到上次编辑的位置
augroup UserJumpToLastPosition
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' |
      \ exe "normal! g'\"" |
    \ endif
augroup END

" Vim 获取窗口焦点之后，若发现文件在外部没修改，则自动载入修改后的内容
augroup UserChecktime
  autocmd!
  autocmd FocusGained * checktime
augroup END

augroup UserCocAutocmds
  autocmd!
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

augroup UserStartifyAutocmds
  autocmd!
  autocmd User Startified setlocal buflisted
augroup END

augroup CocExplorerCustom
  autocmd!
  autocmd FileType coc-explorer setlocal relativenumber
  autocmd BufEnter *
    \ if &ft == 'coc-explorer'
    \ | call CocAction('runCommand', 'explorer.doAction', 'closest', ['refresh'])
    \ | endif
augroup END

function! s:OnColorSchemeLoaded() abort
  let s:scl_guibg = matchstr(execute('hi SignColumn'), 'guibg=\zs\S*')
  if empty(s:scl_guibg) | let s:scl_guibg = 'NONE' | endif
  exe 'hi GitAdd                guifg=#00FF00 guibg=' . s:scl_guibg
  exe 'hi GitModify             guifg=#00FFFF guibg=' . s:scl_guibg
  exe 'hi GitDeleteTop          guifg=#FF2222 guibg=' . s:scl_guibg
  exe 'hi GitDeleteBottom       guifg=#FF2222 guibg=' . s:scl_guibg
  exe 'hi GitDeleteTopAndBottom guifg=#FF2222 guibg=' . s:scl_guibg
  exe 'hi CocHintSign           guifg=#15aabf guibg=' . s:scl_guibg
  exe 'hi CocInfoSign           guifg=#fab005 guibg=' . s:scl_guibg
  exe 'hi CocWarningSign        guifg=#ff922b guibg=' . s:scl_guibg
  exe 'hi CocErrorSign          guifg=#ff0000 guibg=' . s:scl_guibg
  exe 'hi CursorLineNr          guibg=' . s:scl_guibg
  exe 'hi MyBookmarkSign        guifg=#0000FF guibg=' . s:scl_guibg
  exe 'hi NonText               guifg=' . s:scl_guibg
  " coclist will(might) change my cursor highlight
  hi Cursor gui=reverse guifg=NONE guibg=NONE
endfunction
call s:OnColorSchemeLoaded()
augroup UserGitSignColumnColor
  autocmd!
  autocmd ColorScheme * call s:OnColorSchemeLoaded()
augroup END
