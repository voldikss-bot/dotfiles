" LeaderF
nmap <silent> <Leader>ff :Leaderf file<CR>
nmap <silent> <Leader>fb :Leaderf buffer<CR>
nmap <silent> <Leader>fm :Leaderf mru<CR>
nmap <silent> <Leader>fg :Leaderf rg<CR>
nmap <silent> <Leader>ft :LeaderfBufTagAll<CR>
noremap <silent> <Leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <silent> <Leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <silent> <Leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <silent> <Leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_StlSeparator   = {'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers    = ['.project', '.svn', '.git', '.idea']
let g:Lf_MruFileExclude = ['*.so','*.py[c0]','*.exe','*.sw?']
let g:Lf_DefaultExternalTool = ""
let g:Lf_UseVersionControlTool = 0
let g:Lf_RgConfig = [
    \ "--glob=!OmegaOptions.bak",
    \ "--no-ignore"
\ ]
let g:Lf_WildIgnore = {
  \ 'dir': [
    \ '.svn',
    \ '.git',
    \ '.hg',
    \ '.cache',
    \ '.idea',
    \ '.android',
    \ '.gradle',
    \ '.IntelliJIdea*'
  \ ],
  \ 'file': [
    \ '*.sw?',
    \ '~$*',
    \ '*.exe',
    \ '*.o',
    \ '*.so',
    \ '*.py[co]'
  \ ]
\ }
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_CacheDirectory       = expand('~/.cache/nvim')
let g:Lf_ShowRelativePath     = 1
let g:Lf_HideHelp             = 1
let g:Lf_ShowHidden           = 1
let g:Lf_PreviewResult        = {'Function':0, 'BufTag':0}
let g:Lf_IndexTimeLimit       = 10
let g:Lf_Ctags                = "/usr/local/bin/ctags"
" let g:Lf_PreviewCode = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
