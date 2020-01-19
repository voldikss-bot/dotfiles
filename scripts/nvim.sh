#! /usr/bin/env bash

if ! command -v nvim; then
    echo "NeoVim was not installed"
else
    sudo pip3 install pynvim
    sudo pip3 install yapf
    sudo pip3 install flake8
    sudo pip3 install autopep8
    sudo pip3 install python-language-server
    sudo pip3 install pylint
    sudo pip3 install neovim-remote
    sudo yarn global add neovim
    sudo yarn global add bash-language-server
    sudo yarn global add write-good
    sudo yarn global add markdownlint-cli

    if [ ! -d "~/.config/nvim" ]; then
        mkdir -p ~/.config/nvim
    fi

    bash ./nvim_softlink.sh
    bash ./dein_install.sh

    nvim +PI +qa
fi
