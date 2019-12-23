#! /usr/bin/env bash

echo "Installing Fonts..."
sudo mkdir -p ~/.local/share/fonts
sudo cp ../fonts/* ~/.local/share/fonts
cd ~/.local/share/fonts
sudo mkfontscale
sudo mkfontdir
fc-cache -f -v
cd -
