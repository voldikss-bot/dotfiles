" vim:fdm=marker:fmr=[[[,]]]
" ========================================================================
" Description: autoload/util/lightline.vim
" Author: voldikss
" GitHub: https://github.com/voldikss/dotfiles
" ========================================================================

" LightlineAbsolutePath: [[[2
function! util#lightline#absPath()
    let path = substitute(expand('%:p'), $HOME, '~', 'g')
    if 2.6*len(path) > winwidth(0)
        let path = pathshorten(path)
    endif
    return path
endfunction
" LightlineMode: [[[2
function! util#lightline#mode()
  return &filetype ==# 'defx' ? 'Defx' :
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
" LightlineFilename: [[[2
function! util#lightline#fileName()
  let filename = &filetype ==# 'defx' ? '' :
        \ &filetype ==# 'denite' ? '' :
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
" LightlineFugitive: [[[2
function! util#lightline#fugitive()
  if exists('*fugitive#head') && &filetype !~# '\v(defx|denite|help|man|qf|tagbar|Mundo|vista)'
    let branch = fugitive#head()
    return branch !=# '' ? ''. branch : ''
  endif
  return ''
endfunction
" LightlineFileFormat: [[[2
function! util#lightline#fileFormat()
  return &filetype !=# 'defx' &&
        \ &filetype !=# 'denite' &&
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
" LightlineFiletype: [[[2
function! util#lightline#fileType()
  return &filetype !=# 'defx' &&
        \ &filetype !=# 'denite' &&
        \ &filetype !=# 'gitv' &&
        \ &filetype !=# 'help' &&
        \ &filetype !=# 'man' &&
        \ &filetype !=# 'qf' &&
        \ &filetype !=# 'startify' &&
        \ &filetype !=# 'Mundo' &&
        \ expand('%:t') !~ '__Tagbar__\|__vista__' &&
        \ winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
endfunction
" LightlineFileEncoding: [[[2
function! util#lightline#fileEncoding()
  return &filetype !=# 'defx' &&
        \ &filetype !=# 'denite' &&
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
" LightlineReadonly: [[[2
function! util#lightline#readOnly()
  return &readonly && &filetype !~# '\v(defx|denite|help|man|qf|startify)' && expand('%:t') !~ ('__Tagbar__\|__vista__') ? '' : ''
endfunction
