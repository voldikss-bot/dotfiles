#! /usr/bin/env bash

if ! command -v nvim; then
    echo "NeoVim was not installed"
else
    sudo pip3 install pynvim yapf flake8 autopep8 python-language-server pylint
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
