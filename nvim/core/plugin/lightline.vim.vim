let g:lightline = {
  \ 'colorscheme': 'aurora',
  \ 'active': {
    \ 'left': [
      \ ['mode', 'paste'],
      \ ['fugitive', 'readonly', 'filename'],
      \ ['absolutepath']
    \ ],
    \ 'right': [
      \ ['asyncrun_status'],
      \ ['lineinfo'],
      \ ['percent'],
      \ ['cocstatus', 'fileformat', 'fileencoding'],
      \ ['filetype'],
    \ ]
  \ },
  \ 'component': {
    \ 'lineinfo': ' %4l,%-3v',
    \ 'asyncrun_status': '%{g:asyncrun_status}',
    \ 'close': '%{has("nvim") ? " NVIM 😆" : " VIM "}',
    \ 'vim_logo': "😆 "
  \ },
  \ 'component_function': {
    \ 'mode': 'userfunc#lightline#Mode',
    \ 'fugitive': 'userfunc#lightline#GitBranch',
    \ 'cocstatus': 'coc#status',
    \ 'readonly': 'userfunc#lightline#ReadOnly',
    \ 'filename': 'userfunc#lightline#FileName',
    \ 'fileformat': 'userfunc#lightline#FileFormat',
    \ 'fileencoding': 'userfunc#lightline#FileEncoding',
    \ 'filetype': 'userfunc#lightline#FileType',
    \ 'absolutepath': 'userfunc#lightline#AbsPath'
  \ },
  \ 'tabline': {
    \ 'left': [['vim_logo', 'buffers']],
    \ 'right': [['close']],
    \ 'subseparator': {
      \ 'left': '│',
      \ 'right': '│'
    \ }
  \ },
  \ 'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
  \ 'component_type': { 'buffers': 'tabsel' },
  \ 'subseparator': {
    \ 'left': '│',
    \ 'right': '│'
  \ }
\ }
