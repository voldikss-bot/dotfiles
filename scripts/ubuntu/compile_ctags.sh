#! /usr/bin/env bash

git clone https://github.com/universal-ctags/ctags.git --depth=1
sudo apt install autoconf -y
sudo apt install pkg-config -y
cd ctags
./autogen.sh
./configure
sudo make
sudo make install
cd -
rm -rf ctags
