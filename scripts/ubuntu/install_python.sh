#! /usr/bin/env bash

echo "Installing Python..."
sudo apt install python-dev python3-dev python-pip python3-pip idle3 -y
sudo -H pip3 install requests numpy scipy matplotlib thefuck
