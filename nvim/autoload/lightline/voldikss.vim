" ============================================================================
" FileName: voldikss.vim
" Description: My own functions for lightline
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" LightlineAbsolutePath:
function! lightline#voldikss#absPath()
  let path = substitute(expand('%:p'), $HOME, '~', 'g')
  if 2.6*len(path) > winwidth(0)
    let path = pathshorten(path)
  endif
  return path
endfunction
" LightlineMode:
function! lightline#voldikss#mode()
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
" LightlineFilename:
function! lightline#voldikss#fileName()
  let filename = &filetype ==# 'denite' ? '' :
    \ &filetype ==# 'gitv' ? '' :
    \ &filetype ==# 'help' ? '' :
    \ &filetype ==# 'man' ? '' :
    \ &filetype ==# 'startify' ? '' :
    \ &filetype ==# 'Mundo' ? '' :
    \ expand('%:t') =~ '__Tagbar__\|__vista__' ? '' :
    \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' ✎' : ''
  return filename . modified
endfunction
" LightlineFugitive:
function! lightline#voldikss#fugitive()
  if exists('*fugitive#head') && &filetype !~# '\v(denite|help|man|qf|tagbar|Mundo|vista)'
    let branch = fugitive#head()
    return branch !=# '' ? ''. branch : ''
  endif
  return ''
endfunction
" LightlineFileFormat:
function! lightline#voldikss#fileFormat()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype != 'Mundo' &&
    \ expand('%:t') !~ '__Tagbar__\|__vista__' &&
    \ winwidth(0) > 70
    \ ? &fileformat : ''
endfunction
" LightlineFiletype:
function! lightline#voldikss#fileType()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype !=# 'Mundo' &&
    \ expand('%:t') !~ '__Tagbar__\|__vista__' &&
    \ winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
endfunction
" LightlineFileEncoding:
function! lightline#voldikss#fileEncoding()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype !=# 'Mundo' &&
    \ expand('%:t') !~ '__Tagbar__\|__vista__' &&
    \ winwidth(0) > 70
    \ ? &fileencoding : ''
endfunction
" LightlineReadonly:
function! lightline#voldikss#readOnly()
  return &readonly && &filetype !~# '\v(denite|help|man|qf|startify)' && expand('%:t') !~ ('__Tagbar__\|__vista__') ? '' : ''
endfunction
