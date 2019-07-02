#! /usr/local/bin/bash

# cwd: vim-master

sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

./configure --with-features=huge \\
    --enable-multibyte \\
    --enable-rubyinterp=yes \\
    --enable-python3interp=yes \\
    --with-python-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ \\
    --enable-perlinterp=yes \\
    --enable-luainterp=yes \\
    --enable-gui=gtk2 \\
    --enable-cscope \\
    --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81

sudo make install
