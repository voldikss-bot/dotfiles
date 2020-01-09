" coc.nvim
let g:coc_snippet_next = '<tab>'
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
nmap <silent> <C-c> <Plug>(coc-cursors-word)
xmap <silent> <C-c> <Plug>(coc-cursors-range)
nmap <silent> <M-n> <Plug>(coc-diagnostic-next)
nmap <silent> <M-p> <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>ca :CocAction<CR>
nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cf <Plug>(coc-fix-current)
nmap <silent> <Leader>cr <Plug>(coc-references)
nmap <silent> <Leader>cc :CocRestart<CR>
nmap <silent> <Leader>cl :CocList<CR>
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
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
" coc-pairs
let g:coc_pairs_expand = [['（', '）'], ['“', '”'], ['‘', '’'], ['《', '》']]
inoremap <silent> <M-]> <C-R>=keymapfunc#MoveOutPairs(']')<CR>
inoremap <silent> <M-}> <C-R>=keymapfunc#MoveOutPairs('}')<CR>
inoremap <silent> <M-)> <C-R>=keymapfunc#MoveOutPairs(')')<CR>
" coc-smartf
" nmap f <Plug>(coc-smartf-forward)
" nmap F <Plug>(coc-smartf-backward)
" autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
" autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
" coc-bookmark
nmap <silent> ,b <Plug>(coc-bookmark-toggle)
nmap <silent> ,a <Plug>(coc-bookmark-annotate)
nmap <silent> gh <Plug>(coc-bookmark-prev)
nmap <silent> gl <Plug>(coc-bookmark-next)
" coc extensions
let g:coc_global_extensions = [
  \ 'coc-bookmark',
  \ 'coc-browser',
  \ 'coc-clock',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-dictionary',
  \ 'coc-emoji',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-lists',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-post',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-rls',
  \ 'coc-snippets',
  \ 'coc-spell-checker',
  \ 'coc-syntax',
  \ 'coc-tag',
  \ 'coc-todolist',
  \ 'coc-template',
  \ 'coc-translator',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vimtex',
  \ 'coc-vimlsp',
  \ 'coc-yank',
  \ 'coc-zi'
\ ]
if exists('*coc#add_extension')
  call coc#add_extension()
endif
if has('nvim')
  let SignColumnGuiBg = matchstr(execute('hi SignColumn'), 'guibg=\zs\S*')
  exe 'hi GitAdd                guifg=#00FF00 guibg=' . SignColumnGuiBg
  exe 'hi GitModify             guifg=#00FFFF guibg=' . SignColumnGuiBg
  exe 'hi GitDeleteTop          guifg=#FF2222 guibg=' . SignColumnGuiBg
  exe 'hi GitDeleteBottom       guifg=#FF2222 guibg=' . SignColumnGuiBg
  exe 'hi GitDeleteTopAndBottom guifg=#FF2222 guibg=' . SignColumnGuiBg
  exe 'hi CocHintSign           guifg=#15aabf guibg=' . SignColumnGuiBg
  exe 'hi CocInfoSign           guifg=#fab005 guibg=' . SignColumnGuiBg
  exe 'hi CocWarningSign        guifg=#ff922b guibg=' . SignColumnGuiBg
  exe 'hi CocErrorSign          guifg=#ff0000 guibg=' . SignColumnGuiBg
  unlet SignColumnGuiBg
endif

