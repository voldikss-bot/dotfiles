" 安装
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop'] }

" 配置
let g:asyncrun_status = ''
let g:asyncrun_open = 9
let g:asyncrun_rootmarks = [
  \ '.git',
  \ '.svn',
  \ '.root',
  \ '.project',
  \ '.hg',
  \ '.idea',
  \ '.gitignore',
  \ 'Makefile',
  \ 'CMakeLists.txt',
  \ '*.pro',
  \ '.tasks'
  \ ]
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
