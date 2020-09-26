nnoremap <silent> <F2>  :Defx<CR>
silent! call defx#custom#option('_', {
  \ 'columns': 'mark:git:indent:icons:filename',
  \ 'winwidth': 40,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'buffer_name': '',
  \ 'toggle': 1,
  \ 'resume': 1
  \ })

silent! call defx#custom#column('icon', {
  \ 'directory_icon': '',
  \ 'opened_icon': '',
  \ 'root_icon': ""
  \ })

silent! call defx#custom#column('mark', {
  \ 'readonly_icon': "",
  \ 'selected_icon': "",
  \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  setlocal nonumber
  setlocal listchars=
  setlocal foldcolumn=0
  " setlocal buftype=nofile
  setlocal noswapfile
  setlocal nolist
  setlocal nospell
  setlocal cursorline
  setlocal signcolumn=auto

  " Define mappings
  nnoremap <silent><buffer><expr>   <CR>            defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('multi', ['drop'])
  nnoremap <silent><buffer><expr>   <2-LeftMouse>   defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('multi', ['drop'])
  nnoremap <silent><buffer><expr>   c               defx#do_action('copy')
  nnoremap <silent><buffer><expr>   m               defx#do_action('move')
  nnoremap <silent><buffer><expr>   p               defx#do_action('paste')
  nnoremap <silent><buffer><expr>   l               defx#do_action('open')
  nnoremap <silent><buffer><expr>   E               defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr>   P               defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr>   o               defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr>   K               defx#do_action('new_directory')
  nnoremap <silent><buffer><expr>   N               defx#do_action('new_file')
  nnoremap <silent><buffer><expr>   M               defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr>   C               defx#do_action('toggle_columns', 'mark:git:icons:filename:size:time')
  nnoremap <silent><buffer><expr>   S               defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr>   d               defx#do_action('remove')
  nnoremap <silent><buffer><expr>   r               defx#do_action('rename')
  nnoremap <silent><buffer><expr>   !               defx#do_action('execute_command')
  nnoremap <silent><buffer><expr>   x               defx#do_action('execute_system')
  nnoremap <silent><buffer><expr>   yy              defx#do_action('yank_path')
  nnoremap <silent><buffer><expr>   .               defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr>   <C-o>           defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr>   <C-i>           defx#do_action('open')
  nnoremap <silent><buffer><expr>   q               defx#do_action('quit')
  nnoremap <silent><buffer><expr>   v               defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr>   *               defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr>   <C-l>           defx#do_action('redraw')
  nnoremap <silent><buffer><expr>   <C-g>           defx#do_action('print')
  nnoremap <silent><buffer><expr>   cd              defx#do_action('change_vim_cwd')
endfunction
