" 安装
Plug 'neoclide/coc.nvim', {'do': 'npm install'}

" 配置
" neoclide/coc.nvim
let g:coc_data_home = '~/.config/coc'
nnoremap <silent><expr> <C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <silent><expr> <C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
inoremap <silent><expr> <M-j> coc#util#has_float() ? userfunc#coc#FloatScroll(1) : "\<down>"
inoremap <silent><expr> <M-k> coc#util#has_float() ? userfunc#coc#FloatScroll(0) :  "\<up>"
nmap <expr> <silent> <C-c> <SID>select_current_word_and_go_next()
function! s:select_current_word_and_go_next()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  " based on coc readme, this has been modified
  " because I have mapped * to m`:keepjumps normal! *``zz<cr>
  return "*n\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunction
nmap <silent> <C-s> :CocSearch <C-r><C-w><Cr>
nmap <silent> <M-n> <Plug>(coc-diagnostic-next)
nmap <silent> <M-p> <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>ca :CocAction<CR>
nmap <silent> <Leader>cd :call userfunc#coc#GoToDefinition()<CR>
nmap <silent> <Leader>ci <Plug>(coc-implementation)
" nmap <silent> gd :call userfunc#coc#GoToDefinition()<CR>
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>cf <Plug>(coc-fix-current)
nmap <silent> <Leader>cf <Plug>(coc-fix-current)
nmap <silent> <Leader>rf <Plug>(coc-references)
nmap <silent> <Leader>cr :CocRestart<CR>
nmap <silent> cl :CocList<CR>
nmap <silent> <Leader>ct :CocList tasks<CR>
nmap <silent> ,cr        :call CocAction('rename')<CR>
xmap if <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-a)
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
" coc-git
nmap <expr> <C-up>   &diff==1 ? '[c' : '<Plug>(coc-git-prevchunk)'
nmap <expr> <C-down> &diff==1 ? ']c' : '<Plug>(coc-git-nextchunk)'
nmap <expr> gk       &diff==1 ? '[c' : '<Plug>(coc-git-prevchunk)'
nmap <expr> gj       &diff==1 ? ']c' : '<Plug>(coc-git-nextchunk)'
nnoremap <silent> <Leader>hs :CocCommand git.chunkStage<CR>
nnoremap <silent> <Leader>hu :CocCommand git.chunkUndo<CR>
nnoremap <silent> <Leader>go :CocCommand git.browserOpen<CR>
nnoremap <silent> <Leader>gv :CocCommand git.chunkInfo<CR>
nnoremap <silent> <Leader>gm :CocCommand git.showCommit<CR>
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
" coc-pairs
let g:coc_pairs_expand = [['（', '）'], ['“', '”'], ['‘', '’'], ['《', '》']]
" coc-bookmark
nmap <silent> ,b <Plug>(coc-bookmark-toggle)
nmap <silent> ,a <Plug>(coc-bookmark-annotate)
nmap <silent> gh <Plug>(coc-bookmark-prev)
nmap <silent> gl <Plug>(coc-bookmark-next)
" coc-snippets
let g:coc_snippet_next = '<tab>'
" coc extensions
let g:coc_global_extensions = [
  \ 'coc-bookmark',
  \ 'coc-browser',
  \ 'coc-clock',
  \ 'coc-cmake',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-dictionary',
  \ 'coc-ecdict',
  \ 'coc-emmet',
  \ 'coc-emoji',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-floaterm',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-leetcode',
  \ 'coc-lists',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-post',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-rainbow-fart',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-syntax',
  \ 'coc-tag',
  \ 'coc-tasks',
  \ 'coc-template',
  \ 'coc-todolist',
  \ 'coc-translator',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-vimtex',
  \ 'coc-word',
  \ 'coc-yank'
\ ]
