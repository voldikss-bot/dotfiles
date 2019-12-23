#! /usr/bin/env bash

echo "Installing dein.vim..."
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm -rf ./installer.sh
