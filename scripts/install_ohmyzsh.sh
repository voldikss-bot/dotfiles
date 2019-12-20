#! /usr/bin/env bash

if ! command zsh; then
    echo "Please install zsh first."
else
    curl -L git.io/antigen > ~/.antigen.zsh

    ### Clone oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        echo "NOTE: oh-my-zsh has already been installed and won't be installed here"
    fi

    ### Plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

    ln -sf "$(readlink -f ../dotfiles/.zshrc)" "$HOME/.zshrc"
    ln -sf "$(readlink -f ../dotfiles/.af-magic.zsh-theme)" "$HOME/.af-magic.zsh-theme"
    source ~/.zshrc
fi
