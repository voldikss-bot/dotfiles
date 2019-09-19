#! /bin/bash

# Reset
Reset='\033[0m'           # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

cecho() {
    echo -e "${Yellow}$@"${Reset};
}

uninstall() {
    cecho "Uninstall libreoffice, firefox..."
    sudo apt remove libreoffice libreoffice-common firefox -y
}

initialize(){
    cecho "Initializing..."
    echo "Replace sources.list?"
    read ans
    case $ans in
        [Yy]*)
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
        sudo cp ../sources/ubuntu/sources.list /etc/apt/sources.list;;
    esac
    sudo apt update -y
    sudo apt upgrade -y

    ### create soft links
    for file in ../configs/.*[!.]; do
        echo ln -sf $(basename $file) $HOME/$(basename $file)
        ln -sf $(readlink -f $file) $HOME/$(basename $file)
    done
}

install_common_tools(){
    cecho "Installing common tools..."
    ### common tools
    sudo apt install openssh-client git wget curl unrar unzip tree xclip make cmake -y
    sudo apt install trash-cli -y
    sudo apt install catimg -y
    sudo apt install zathura -y
    ### ripgrep
    if ! command -v rg; then
        wget -O rg.deb https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
        sudo dpkg -i rg.deb
        rm rg.deb
    fi
    ### fzf
    if ! command -v fzf; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all --64
    fi
    ### prettyping
    # if ! command -v prettyping; then
    #     git clone https://github.com/denilsonsa/prettyping.git --depth 1
    #     sudo cp -f ./prettyping/prettyping /usr/bin/
    #     rm -rf prettyping
    # fi
    ### htop
    sudo apt install htop -y
    ### ranger
    sudo apt install ranger -y
    ### ncdu
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
    ### nnn
    if ! command -v nnn; then
        git clone https://github.com/jarun/nnn --depth 1
        cd nnn
        sudo apt install pkg-config libncursesw5-dev libreadline6-dev -y
        make
        sudo make install
        cd ..
        rm -rf nnn
    fi
    ### v2ray
    if [ ! -d "/etc/v2ray" ] ; then
        curl -LO -s https://install.direct/go.sh
        sudo bash go.sh
        rm -f go.sh
    fi
    ### peek
    sudo add-apt-repository ppa:peek-developers/stable -y
    sudo apt update
    sudo apt install peek -y
}

install_ohmyzsh(){
    cecho "Installing Oh-my-zsh and others..."
    sudo apt install zsh -y
    curl -L git.io/antigen > ~/.antigen.zsh
    ### oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        cecho "NOTE: oh-my-zsh has already been installed and won't be installed here"
    fi

    ### Plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    sudo apt install extract -y

    ln -sf $(readlink -f ../configs/.zshrc) $HOME/.zshrc
    ln -sf $(readlink -f ../configs/.af-magic.zsh-theme) $HOME/.af-magic.zsh-theme
    source ~/.zshrc
}

install_nvim(){
    cecho "Installing NeoVim..."
    sudo apt remove vim -y
    sudo apt remove vim-gtk -y

    if ! command -v nvim; then
        sudo add-apt-repository ppa:neovim-ppa/unstable -y
        sudo apt update
        sudo apt install neovim -y
    fi

    nodejs_install
    ctags_install
    gtags_install

    sudo -H pip3 install pynvim yapf flake8 autopep8
    sudo yarn global add neovim
    sudo yarn global add bash-language-server
    sudo yarn global add write-good
    sudo yarn global add markdownlint-cli

    sudo apt install shellcheck -y
    sudo apt install lua5.3 -y

    ln -sf $(readlink -f ../vim) $HOME/.vim
    ln -sf $(readlink -f ../vim/init.vim) $HOME/.config/nvim/init.vim
    ln -sf $(readlink -f ../vim/init.vim) $HOME/.config/nvim/.vimrc
    ln -sf $(readlink -f ../vim/coc-settings.json) $HOME/.config/nvim/coc-settings.json

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm -rf ./installer.sh

    nvim +PI +qa
}

install_python(){
    cecho "Installing Python..."
    sudo apt install python-dev python3-dev python-pip python3-pip idle3 -y
    sudo -H pip3 install requests numpy scipy matplotlib thefuck
    ln -sf $(readlink -f ../configs/.pip) $HOME/.pip
    ln -sf $(readlink -f ../configs/.idlerc) $HOME/.idlerc
}

install_tmux(){
    cecho "Installing tmux..."
    sudo apt install tmux -y
    ln -sf $(readlink -f ../configs/.tmux.conf) $HOME/.tmux.conf
}

nodejs_install(){
    cecho "Installing nodejs..."
    ### nodejs
    if ! command -v nodejs; then
        curl -LO install-node.now.sh/lts
        sudo bash ./lts --yes
        rm ./lts
    fi

    ### yarn
    if ! command -v yarn; then
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        sudo apt update -y
        sudo apt install yarn -y
        yarn --version
    else
        cecho "Nodejs has already been installed."
    fi
}

ctags_install(){
    cecho "Installing ctags..."
    if ! command -v ctags; then
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
    else
        cecho "Ctags has already been installed."
    fi
}

gtags_install() {
    cecho "Installing gtags..."
    if ! command -v gtags; then
        # currently the latest version is v6.6.3
        # https://www.gnu.org/software/global/download.html
        wget -c http://tamacom.com/global/global-6.6.3.tar.gz
        tar -xf global-6.6.3.tar.gz
        cd global-6.6.3
        sudo apt install automake autoconf flex bison gperf libtool libtool-bin texinfo -y
        sh reconf.sh
        ./configure
        make
        sudo make install
        sudo -H pip3 install pygments
        cd ..
        rm -rf global-6.6.3.tar.gz
        rm -rf global-6.6.3
    else
        cecho "Gtags has already been installed."
    fi
}

install_fonts(){
    cecho "Installing Fonts..."
    sudo mkdir -p ~/.local/share/fonts
    sudo cp ../fonts/* ~/.local/share/fonts
    cd ~/.local/share/fonts
    sudo mkfontscale
    sudo mkfontdir
    fc-cache -f -v
    cd -
}

install_ccls() {
    cecho "Installing ccls..."
    if ! command -v ccls ; then
        sudo apt install zlib1g-dev -y
        git clone --depth=1 --recursive https://github.com/MaskRay/ccls
        cd ccls
        wget -c wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
        tar -xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
        cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
        cmake --build Release
        rm clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        rm -rf clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-16.04
        cd ..
        mkdir -p ~/Applications
        mv ccls ~/Applications/
        sudo ln -sf ~/Applications/ccls/Release/ccls /usr/bin/ccls
    else
        cecho "NOTE: ccls has already been installed and won't be installed here"
    fi
}

install_latex() {
    cecho "Installing latex..."
    sudo apt install texlive -y
    sudo apt install texlive-lang-chinese -y
    sudo apt install texlive-xetex -y
    sudo apt install latexmk -y
}

goldendict_install() {
    # dictionary download
    # https://github.com/skywind3000/ECDICT/releases/download/1.0.28/ecdict-mdx-style-28.zip
    sudo apt install libdouble-conversion1 libqt5svg5 -y
    sudo apt install goldendict -y
}

install_others(){
    cecho "Installing others..."
    ### gnome-tweak-tool
    sudo apt install gnome-tweak-tool -y
    ### google-chrome
    sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    sudo apt update
    sudo apt install google-chrome-stable -y
    ### netease-cloud-music
    wget -O netease-cloud-music.deb http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
    sudo dpkg -i netease-cloud-music.deb
    sudo apt install -f
    rm netease-cloud-music.deb
    ### sougou-pinyin input method
    wget -O sogou-pinyin.deb http://pinyin.sogou.com/linux/download.php\?f\=linux\&bit\=64
    sudo dpkg -i sogou-pinyin.deb
    sudo apt install -f
    rm sougou-pinyin.deb
}

confirm(){
    while true; do
        echo "Install $1?[y/n]"
        read ans
        case $ans in
            [Yy]* ) $2; break;;
            [Nn]* ) break;;
            * ) echo "Please choose yes or no [y/n]:";;
        esac
    done
}

install_dotfiles()
{
    sudo
    # Initial
    initialize

    # Install by default
    install_common_tools
    install_fonts
    install_python
    install_nvim

    # Confirm needed install
    confirm tmux install_tmux
    confirm latex install_latex
    confirm ccls install_ccls
    others="Others: gnome-tweak | chrome | goldendict | netease-cloud-music | sougou-pinyin"
    confirm $others install_others

    # oh_my_zsh
    install_ohmyzsh
}
