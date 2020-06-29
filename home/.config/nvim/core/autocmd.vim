" ============================================================================
" FileName: autocmd.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" autocmd CmdlineEnter * call feedkeys("\<C-p>")
augroup ParenColor
  autocmd!
  autocmd VimEnter,BufWinEnter *
    \ if index(['html', 'htmldjango', 'tex', 'mma', 'vue', 'xml'], &filetype) < 0 |
      \ syntax match paren1 /[{}]/   | hi paren1 guifg=#FF00FF |
      \ syntax match paren2 /[()]/   | hi paren2 guifg=#DF8700 |
      \ syntax match paren3 /[<>]/   | hi paren3 guifg=#0087FF |
      \ syntax match paren4 /[\[\]]/ | hi paren4 guifg=#00FF5F |
    \ endif
augroup END

augroup FileTypeAutocmds
  autocmd!
  autocmd FileType startify nmap <buffer> l <CR>
  autocmd FileType floaterm setlocal nocursorline
  autocmd FileType help setlocal number
  autocmd FileType * set formatoptions-=cro
augroup END

augroup UserAutoSaveBuffer
  autocmd!
  autocmd FocusLost,InsertLeave * call userfunc#file#AutoSave()
augroup END

augroup UserLineNumber
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" augroup UserEqualWindowSize
"   autocmd!
"   autocmd VimResized * exec "normal \<C-w>="
" augroup END

augroup UserJumpToLastPosition
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' |
      \ exe "normal! g'\"" |
    \ endif
augroup END

augroup UserAutoChangeDir
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

augroup UserAutoTemplate
  autocmd!
  autocmd BufNewFile .gitignore,.tasks,.clang-format CocCommand template.templateTop
augroup END

augroup UserChecktime
  autocmd!
  autocmd FocusGained * checktime
augroup END

augroup UserCocAutocmds
  autocmd!
  autocmd User Startified setlocal buflisted
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

augroup UserStartifyAutocmds
  autocmd!
  autocmd User Startified setlocal buflisted
augroup END

" augroup AutoNohlsearch
"   autocmd!
"   autocmd CursorMoved * call userfunc#myhlsearch#start_hl()
" augroup END

augroup CocExplorerCustom
  autocmd!
  autocmd FileType coc-explorer setlocal relativenumber
  autocmd BufEnter *
    \ if &ft == 'coc-explorer'
    \ | call CocAction('runCommand', 'explorer.doAction', 'closest', ['refresh'])
    \ | endif
augroup END

if has('nvim')
augroup UserTermSettings " neovim only
  autocmd!
  autocmd TermOpen *
    \ setlocal signcolumn=no |
    \ setlocal nobuflisted |
    \ setlocal nospell |
    \ setlocal modifiable |
    \ nmap <silent><buffer> <Esc> <Cmd>hide<CR>|
    \ nmap <silent><buffer> q :q<CR> |
    \ hi TermCursor guifg=yellow |
    \ call timer_start(10, 'userfunc#asyncrun#term_style')
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
endif
