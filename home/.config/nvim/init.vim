" ============================================================================
" FileName: init.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 Load exec 'so '.s:home.'/'.'<args>'

"=============================================================================
" 基本
"=============================================================================
Load ./core/abbrev.vim
Load ./core/autocmd.vim
Load ./core/basic.vim
Load ./core/command.vim
Load ./core/keymap.vim

"=============================================================================
" 插件
"=============================================================================
call plug#begin('~/.cache/nvim/plugged')
" 运行任务
Plug 'skywind3000/asynctasks.vim'
Load ./core/plugin/asynctasks.vim.vim

" 异步运行
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop'] }
Load ./core/plugin/asyncrun.vim.vim

" coc 全家桶，提供全部 LSP 体验
Plug 'neoclide/coc.nvim', {'do': 'npm install'}
Load ./core/plugin/coc.nvim.vim

" 缩进线
Plug 'Yggdroot/indentLine'
Load ./core/plugin/indentLine.vim

" 模糊查找
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Load ./core/plugin/leaderf.vim

" 状态栏
Plug 'itchyny/lightline.vim'
Load ./core/plugin/lightline.vim.vim

" 顶部 tab 栏
Plug 'mengelbrecht/lightline-bufferline'
Load ./core/plugin/lightline-bufferline.vim

" markdown 预览
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': 'cd app && npm install'}
Load ./core/plugin/markdown-preview.nvim.vim

" 快速位置跳转
Plug 'easymotion/vim-easymotion'
Load ./core/plugin/vim-easymotion.vim

" 移动整行
Plug 'matze/vim-move'
Load ./core/plugin/vim-move.vim

" 编辑历史记录，撤销树
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Load ./core/plugin/vim-mundo.vim

" 启动界面
Plug 'mhinz/vim-startify'
Load ./core/plugin/vim-startify.vim

" 浮动内置终端
Plug 'voldikss/vim-floaterm'
Load ./core/plugin/vim-floaterm.vim

" 翻译插件
Plug 'voldikss/vim-translator'
Load ./core/plugin/vim-translator.vim

" 杀手级插件，不知道该怎么介绍，建议去GitHub自己查看其介绍
Plug 'tpope/vim-surround'

" 重复上一次修改
Plug 'tpope/vim-repeat'

" Git 操作相关
Plug 'tpope/vim-fugitive'

" 在侧边栏显示相关信息
Plug 'kshenoy/vim-signature'

" 扩展文本对象，很实用
Plug 'wellle/targets.vim'

" 注释插件
Plug 'tomtom/tcomment_vim'

" 针对不同语言的常见的补全关键词
Plug 'skywind3000/vim-dict'

" 中文文档
Plug 'yianwillis/vimcdoc'

" Tag 显示插件
Plug 'liuchengxu/vista.vim'
call plug#end()
