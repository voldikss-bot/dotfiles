" ============================================================================
" FileName: init.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 Load exec 'so '.s:home.'/'.'<args>'

" 基本
Load ./core/abbrev.vim
Load ./core/autocmd.vim
Load ./core/basic.vim
Load ./core/command.vim
Load ./core/keymap.vim
Load ./core/variable.vim

" 插件
call plug#begin('~/.cache/nvim/plugged')
Load ./core/plugin/asynctasks.vim.vim
Load ./core/plugin/asyncrun.vim.vim
Load ./core/plugin/coc.nvim.vim
Load ./core/plugin/indentLine.vim
Load ./core/plugin/leaderf.vim
Load ./core/plugin/lightline-bufferline.vim
Load ./core/plugin/lightline.vim.vim
Load ./core/plugin/markdown-preview.nvim.vim
Load ./core/plugin/targets.vim
Load ./core/plugin/tcomment_vim.vim
Load ./core/plugin/vim-dict.vim
Load ./core/plugin/vim-easymotion.vim
Load ./core/plugin/vim-floaterm.vim
Load ./core/plugin/vim-fugitive.vim
Load ./core/plugin/vim-move.vim
Load ./core/plugin/vim-mundo.vim
Load ./core/plugin/vim-repeat.vim
Load ./core/plugin/vim-signature.vim
Load ./core/plugin/vim-startify.vim
Load ./core/plugin/vim-surround.vim
Load ./core/plugin/vim-translator.vim
Load ./core/plugin/vimcdoc.vim
Load ./core/plugin/vista.vim.vim
call plug#end()
