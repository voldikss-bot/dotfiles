" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" AbsPath:
function! userfunc#lightline#AbsPath()
  let path = substitute(expand('%:p'), $HOME, '~', 'g')
  if 2.6*len(path) > winwidth(0)
    let path = pathshorten(path)
  endif
  return path
endfunction

" Mode:
function! userfunc#lightline#Mode()
  return &filetype ==# 'coc-explorer' ? 'coc-explorer' :
    \ &filetype ==# 'denite' ? 'Denite' :
    \ &filetype ==# 'gitv' ? 'GitV' :
    \ &filetype ==# 'help' ? 'Help' :
    \ &filetype ==# 'man' ? 'Man' :
    \ &filetype ==# 'qf' && !getwininfo(win_getid(winnr()))[0]['loclist'] ? 'QuickFix' :
    \ &filetype ==# 'qf' && getwininfo(win_getid(winnr()))[0]['loclist'] ? 'Location List' :
    \ &filetype ==# 'startify' ? 'Startify' :
    \ &filetype ==# 'Mundo' ? 'Mundo' :
    \ expand('%:t') =~ '__Tagbar__' ? 'Tagbar' :
    \ expand('%:t') =~ '__vista__' ? 'Vista' :
    \ lightline#mode()
endfunction

" FileName:
function! userfunc#lightline#FileName()
  let filename = &filetype ==# 'denite' ? '' :
    \ &filetype ==# 'gitv' ? '' :
    \ &filetype ==# 'help' ? '' :
    \ &filetype ==# 'man' ? '' :
    \ &filetype ==# 'startify' ? '' :
    \ &filetype ==# 'Mundo' ? '' :
    \ expand('%:t') =~ '__vista__' ? '' :
    \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' ✎' : ''
  return filename . modified
endfunction

" GitBranch:
function! userfunc#lightline#GitBranch()
  if exists('*FugitiveHead') && &filetype !~# '\v(denite|help|man|qf|tagbar|Mundo|vista)'
    let branch = FugitiveHead()
    return branch !=# '' ? ''. branch : ''
  endif
  return ''
endfunction

" FileFormat:
function! userfunc#lightline#FileFormat()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype != 'Mundo' &&
    \ expand('%:t') !~ '__vista__' &&
    \ winwidth(0) > 70
    \ ? &fileformat : ''
endfunction

" FileType:
function! userfunc#lightline#FileType()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype !=# 'Mundo' &&
    \ expand('%:t') !~ '__vista__' &&
    \ winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
endfunction

" FileEncoding:
function! userfunc#lightline#FileEncoding()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype !=# 'Mundo' &&
    \ expand('%:t') !~ '__vista__' &&
    \ winwidth(0) > 70
    \ ? &fileencoding : ''
endfunction

" ReadOnly:
function! userfunc#lightline#ReadOnly()
  return &readonly && &filetype !~# '\v(denite|help|man|qf|startify)' && expand('%:t') !~ ('__vista__') ? '' : ''
endfunction
