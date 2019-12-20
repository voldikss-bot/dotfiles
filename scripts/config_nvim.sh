#! /usr/bin/env bash

if ! command -v nvim; then
    echo "NeoVim was not installed"
else
    sudo pip3 install pynvim yapf flake8 autopep8
    sudo yarn global add neovim
    sudo yarn global add bash-language-server
    sudo yarn global add write-good
    sudo yarn global add markdownlint-cli

    if [ ! -d "~/.config/nvim" ]; then
        mkdir -p ~/.config/nvim
    fi

    bash ./softlink_vim.sh

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm -rf ./installer.sh

    nvim +PI +qa
fi
