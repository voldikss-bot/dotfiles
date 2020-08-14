nmap <silent> <Leader>fb :Leaderf buffer<CR>
nmap <silent> <Leader>fc :Leaderf cmdHistory<CR>
nmap <silent> <Leader>ff :Leaderf file<CR>
nmap <silent> <Leader>fg :Leaderf rg<CR>
nmap <silent> <Leader>fl :Leaderf line<CR>
nmap <silent> <Leader>fm :Leaderf mru<CR>
nmap <silent> <Leader>ft :Leaderf bufTag<CR>
nmap <silent> <Leader>fu :Leaderf function<CR>
let g:Lf_CacheDirectory       = expand('~/.cache/nvim')
let g:Lf_CommandMap = {
  \'<Up>': ['<C-p>'],
  \'<Down>': ['<C-n>']
\}
let g:Lf_Ctags                = "/usr/local/bin/ctags"
let g:Lf_DefaultExternalTool = ""
let g:Lf_FilerShowDevIcons = 1
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_HideHelp             = 1
let g:Lf_IndexTimeLimit       = 10
let g:Lf_MruFileExclude = ['*.so','*.py[c0]','*.exe','*.sw?']
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult        = {'Function':0, 'BufTag':0}
let g:Lf_RgConfig = [
  \"--glob=!OmegaOptions.bak",
  \"--glob=!node_modules",
  \"--glob=!lib/index.js",
  \"--glob=!target",
  \"--glob=!tags",
  \"--glob=!build",
  \"--glob=!.git",
  \"--glob=!.ccls-cache",
  \"--no-ignore",
  \"--hidden"
\]
let g:Lf_RootMarkers    = [
  \'.project',
  \'.svn',
  \'.git',
  \'.idea',
  \'.gitignore',
  \'.tasks',
  \'.clang-format',
  \'CMakeLists.txt',
  \'compile_commands.json'
\]
let g:Lf_ShowHidden           = 1
let g:Lf_ShowRelativePath     = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator   = {'left': '', 'right': '', 'font': ''}
let g:Lf_UseVersionControlTool = 0
let g:Lf_WildIgnore = {
  \'dir': [
    \'.svn',
    \'.git',
    \'.hg',
    \'.cache',
    \'.idea',
    \'.ccls-cache',
    \'.android',
    \'.gradle',
    \'.IntelliJIdea*',
    \'node_modules',
    \'build'
  \],
  \'file': [
    \'*.sw?',
    \'~$*',
    \'*.exe',
    \'*.o',
    \'*.so',
    \'*.py[co]'
  \]
\}
let g:Lf_WindowHeight = 0.4
let g:Lf_WorkingDirectoryMode = 'Ac'
