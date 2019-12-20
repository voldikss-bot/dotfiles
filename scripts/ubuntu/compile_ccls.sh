#! /usr/bin/env bash

echo "Installing ccls..."
cwd=$(pwd)
if ! command -v ccls ; then
    sudo apt install zlib1g-dev -y
    mkdir -p ~/Applications
    cd ~/Applications
    git clone --depth=1 --recursive https://github.com/MaskRay/ccls
    cd ccls
    wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
    cmake --build Release
    rm -rf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04*
    sudo ln -sf ~/Applications/ccls/Release/ccls /usr/bin/ccls
    cd $cwd
else
    echo "NOTE: ccls has already been installed and won't be installed here"
fi
