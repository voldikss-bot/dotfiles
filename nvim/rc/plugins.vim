" vim:et sw=2 ts=2 fdm=marker fmr=[[[,]]]
" ============================================================================
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" Description:
" ============================================================================

call plug#begin('~/.cache/plugged')
" Languages [[[1
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown'}
Plug 'alvan/vim-closetag', {'for': ['html', 'xml']}
Plug 'numirias/semshi', {'for': 'python'}
Plug 'posva/vim-vue', {'for': 'vue'}
" Completion [[[1
Plug 'neoclide/coc.nvim'
" Style [[[1
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify', {'on': 'Startify'}
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'kshenoy/vim-signature'
Plug 'guns/xterm-color-table.vim', {'on': 'XtermColorTable'}
" Git [[[1
Plug 'tpope/vim-fugitive'
" Enhancements [[[1
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop']}
Plug 'Yggdroot/LeaderF', {'on': 'Leaderf', 'do': expand('./install'.(has('win64') ? '.bat': '.sh'))}
Plug 'voldikss/vim-browser-search'
Plug 'voldikss/vim-codelf'
Plug 'voldikss/vim-translator'
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/vim-hello-word'
Plug 'lfv89/vim-interestingwords'
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
Plug 'liuchengxu/vim-clap', {'on': 'Clap'}
Plug 'tommcdo/vim-exchange'
Plug 'matze/vim-move'
Plug 'andrewradev/sideways.vim', {'on': ['SidewaysLeft', 'SidewaysRight']}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'foosoft/vim-argwrap', {'on': 'ArgWrap'}
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'wellle/targets.vim'
Plug 'yianwillis/vimcdoc'
call plug#end()
