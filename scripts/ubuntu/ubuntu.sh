#! /usr/bin/env bash

function install_base() {
    sudo apt install openssh-client git wget curl unrar unzip tree xclip make cmake htop ranger gnome-tweak-tool -y
    sudo apt install trash-cli -y
    sudo apt install catimg -y
    sudo apt install zathura -y
    sudo apt install resolvconf -y
}

function install_nvim() {
    sudo apt remove vim -y
    sudo apt remove vim-gtk -y

    if ! command -v nvim; then
        sudo add-apt-repository ppa:neovim-ppa/unstable -y
        sudo apt update
        sudo apt install neovim -y
    fi
}

function install_ripgrep() {
    if ! command -v rg; then
        wget -O rg.deb https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
        sudo dpkg -i rg.deb
        rm rg.deb
    fi
}

function install_fzf() {
    if ! command -v fzf; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all --64
    fi
}

function install_ncdu() {
    if ! command -v ncdu; then
        curl -LO https://dev.yorhel.nl/download/ncdu-1.14.tar.gz
        tar -xf ncdu-1.14.tar.gz
        cd ncdu-1.14
        sudo apt install libncurses5-dev libncursesw5-dev -y
        ./configure --prefix=/usr
        sudo make
        sudo make install
        cd ..
        rm -rf ncdu*
    fi
}

function install_nnn() {
    if ! command -v nnn; then
        git clone https://github.com/jarun/nnn --depth 1
        cd nnn
        sudo apt install pkg-config libncursesw5-dev libreadline6-dev -y
        make
        sudo make install
        cd ..
        rm -rf nnn
    fi
}

function install_v2ray() {
    if [ ! -d "/etc/v2ray" ] ; then
        curl -LO -s https://install.direct/go.sh
        sudo bash go.sh
        rm -f go.sh
    fi
}

function install_peek() {
    sudo add-apt-repository ppa:peek-developers/stable -y
    sudo apt update
    sudo apt install peek -y
}

function install_chrome() {
    sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    sudo apt update
    sudo apt install google-chrome-stable -y
}

function install_cloud_music() {
    wget -O netease-cloud-music.deb http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
    sudo dpkg -i netease-cloud-music.deb
    sudo apt install -f
    rm netease-cloud-music.deb
}

function install_sougou() {
    wget -O sogou-pinyin.deb http://pinyin.sogou.com/linux/download.php\?f\=linux\&bit\=64
    sudo dpkg -i sogou-pinyin.deb
    sudo apt install -f
    rm sougou-pinyin.deb
}

function install_ubuntu() {
    install_base
    install_nvim
    install_ripgrep
    install_fzf
    install_ncdu
    install_nnn
    install_v2ray
    install_peek
    install_chrome
    install_cloud_music
    install_sougou
}
