#! /usr/bin/env bash

# For ubuntu only
# sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

if [ ! -d ./vim-master ]; then
    git clone https://github.com/vim/vim  vim-master --depth 1
fi

cd vim-master

make distclean

./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-python3interp \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=auto \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.3 \
            --enable-cscope \
            --enable-multibyte

make VIMRUNTIMEDIR=/usr/local/share/vim/vim82

sudo make install
sudo ln -sf /usr/local/bin/vim /usr/bin/vim
