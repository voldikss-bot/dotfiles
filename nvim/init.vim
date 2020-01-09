" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

let s:script_path = expand('<sfile>:p:h')
let s:source_list = [
  \ 'globalvars',
  \ 'neovim',
  \ 'plugins',
  \ 'general',
  \ 'autocmds',
  \ 'abbrevs',
  \ 'commands',
  \ 'mappings',
  \ ]

for s:source in s:source_list
  execute 'source ' . s:script_path . '/rc/' . s:source . '.vim'
endfor

for s:config in split(glob(s:script_path . '/rc/plugins/*.vim'),"\n")
  execute 'source ' . s:config
endfor

unlet s:script_path
unlet s:source_list
unlet s:source
unlet s:config
