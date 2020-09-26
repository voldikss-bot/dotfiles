set tagfunc=CocTagFunc
noremap  <silent> <F2>             <Esc>:CocCommand explorer<CR>
noremap! <silent> <F2>             <Esc>:CocCommand explorer<CR>
nnoremap <silent><expr> <C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <silent><expr> <C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
nmap <expr> <silent> <C-c> <SID>select_current_word_and_go_next()
nmap <silent> <C-k> :<C-u>call CocShowDocument()<CR>
nmap <silent> <C-s> :CocSearch <C-r><C-w><Cr>
nmap <silent> <M-n> <Plug>(coc-diagnostic-next)
nmap <silent> <M-p> <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>ca :CocAction<CR>
nmap <silent> <Leader>cd :call CocGoToDefinition()<CR>
nmap <silent> <Leader>ci <Plug>(coc-implementation)
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
" coc-snippets
let g:coc_snippet_next = '<tab>'
" coc extensions
let g:coc_global_extensions = [
  \ 'coc-cmake',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-emoji',
  \ 'coc-explorer',
  \ 'coc-floaterm',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-syntax',
  \ 'coc-tag',
  \ 'coc-tasks',
  \ 'coc-word',
\ ]

function! CocGoToDefinition() abort
  if CocAction('jumpDefinition')
    return v:true
  endif
  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunc

function! CocShowDocument() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunc
