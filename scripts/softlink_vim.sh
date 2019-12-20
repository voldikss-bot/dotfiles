#! /usr/bin/env bash

ln -sf $(readlink -f ../vim) $HOME/.vim
ln -sf $(readlink -f ../vim/init.vim) $HOME/.config/nvim/init.vim
ln -sf $(readlink -f ../vim/init.vim) $HOME/.config/nvim/.vimrc
ln -sf $(readlink -f ../vim/coc-settings.json) $HOME/.config/nvim/coc-settings.json
