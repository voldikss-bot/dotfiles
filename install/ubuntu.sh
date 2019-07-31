#! /bin/bash

# netease cloud music
# sougou pinyin

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

cfence(){
    echo -e "${Green}$@"${Reset};
}
crun() {
    echo -e "${Purple}\$${Reset} ${Cyan}$@"${Reset} ; "$@" ;
}

function uninstall() {
    crun sudo apt remove libreoffice libreoffice-common firefox -y
}

function link() {
    for file in ../conf/.*[!.]; do
        echo ln -sf $(basename $file) $HOME/$(basename $file)
        ln -sf $(readlink -f $file) $HOME/$(basename $file)
    done
}

function initialize(){
    cecho "Initializing..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    crun sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    crun sudo cp ../sources/ubuntu/sources.list /etc/apt/sources.list

    crun sudo apt update -y
    crun sudo apt upgrade -y
}

function common_install(){
    cecho "Installing common used tools..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    # common tools
    crun sudo apt install openssh-client git wget curl unrar unzip tree xclip make cmake -y
    # trash
    crun sudo apt install trash-cli -y
    # catimg
    crun sudo apt install catimg -y
    # ripgrep
    if ! command -v rg; then
        crun wget -O rg.deb https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
        crun sudo dpkg -i rg.deb
        crun rm rg.deb
    fi
    # fzf
    if ! command -v fzf; then
        crun git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        crun ~/.fzf/install --all --64
    fi
    # prettyping
    if ! command -v prettyping; then
        crun git clone https://github.com/denilsonsa/prettyping.git --depth 1
        crun sudo cp -f ./prettyping/prettyping /usr/bin/
        crun rm -rf prettyping
    fi
    # htop
    crun sudo apt install htop -y
    # ranger
    crun sudo apt install ranger -y
    # ncdu
    if ! command -v ncdu; then
        crun curl -LO https://dev.yorhel.nl/download/ncdu-1.14.tar.gz
        crun tar -xf ncdu-1.14.tar.gz
        crun cd ncdu-1.14
        crun sudo apt install libncurses5-dev libncursesw5-dev -y
        crun ./configure --prefix=/usr
        crun sudo make
        crun sudo make install
        crun cd ..
        crun rm -rf ncdu*
    fi
    # nnn
    if ! command -v nnn; then
        crun git clone https://github.com/jarun/nnn --depth 1
        crun cd nnn
        crun sudo apt install pkg-config libncursesw5-dev libreadline6-dev -y
        crun make
        crun sudo make install
        crun cd ..
        crun rm -rf nnn
    fi
    # zathura
    crun sudo apt install zathura -y
    # v2ray
    if [ ! -d "/etc/v2ray" ] ; then
        crun curl -LO -s https://install.direct/go.sh
        crun sudo bash go.sh
        crun rm -f go.sh
    fi
}

function oh_my_zsh_install(){
    cecho "Installing Oh-my-zsh and others..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    # zsh
    crun sudo apt install zsh -y
    crun curl -L git.io/antigen > ~/.antigen.zsh
    # oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        crun sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        cecho "NOTE: oh-my-zsh has already been installed and won't be installed here"
    fi
    ### Plugins
    # zsh-autosuggestions
    crun git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    # zsh-syntax-highlighting
    crun git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    # fasd
    if ! command -v fasd; then
        crun git clone https://github.com/clvv/fasd.git --depth 1
        crun cd fasd
        crun sudo make install
        crun cd ..
        crun rm -rf fasd
    fi
    # extract
    crun sudo apt install extract -y

    ln -sf $(readlink -f ../conf/.zshrc) $HOME/.zshrc
    ln -sf $(readlink -f ../conf/.af-magic.zsh-theme) $HOME/.af-magic.zsh-theme
    crun source ~/.zshrc
}

function vim_install(){
    cecho "Installing NeoVim and others..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    crun sudo apt remove vim -y
    crun sudo apt remove vim-gtk -y

    if ! command -v nvim; then
        crun sudo add-apt-repository ppa:neovim-ppa/unstable -y
        crun sudo apt update
        crun sudo apt install neovim -y
    fi

    nodejs_install
    ctags_install
    gtags_install

    crun sudo -H pip3 install pynvim yapf flake8 autopep8
    crun sudo yarn global add neovim
    crun sudo yarn global add bash-language-server
    crun sudo yarn global add write-good
    crun sudo yarn global add markdownlint-cli

    crun sudo apt install shellcheck -y
    crun sudo apt install lua5.3 -y

    ln -sf $(readlink -f ../vim) $HOME/.vim
    ln -sf $(readlink -f ../vim/init.vim) $HOME/.config/nvim/init.vim
    ln -sf $(readlink -f ../vim/init.vim) $HOME/.config/nvim/.vimrc
    ln -sf $(readlink -f ../vim/coc-settings.json) $HOME/.config/nvim/coc-settings.json

    crun nvim +PlugInstall +qa
}

function python_install(){
    cecho "Installing Python and others..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    crun sudo apt install python-dev python3-dev python-pip python3-pip idle3 -y
    crun sudo -H pip3 install requests numpy scipy matplotlib thefuck
    ln -sf $(readlink -f ../conf/.pip) $HOME/.pip
    ln -sf $(readlink -f ../conf/.idlerc) $HOME/.idlerc
}

function tmux_install(){
    cecho "Installing tmux..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    crun sudo apt install tmux -y
    ln -sf $(readlink -f ../conf/.tmux.conf) $HOME/.tmux.conf
}

function nodejs_install(){
    cecho "Installing nodejs and others..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    if ! command -v nodejs; then
        # nodejs
        crun curl -LO install-node.now.sh/lts
        crun sudo bash ./lts --yes
        crun rm ./lts
    fi

    if ! command -v yarn; then
        # yarn
        crun curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        crun sudo apt update -y
        crun sudo apt install yarn -y
        crun yarn --version
    else
        cecho "Nodejs has already been installed."
    fi
}

function ctags_install(){
    cecho "Installing ctags..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    if ! command -v ctags; then
        crun git clone https://github.com/universal-ctags/ctags.git --depth=1
        crun sudo apt install autoconf -y
        crun sudo apt install pkg-config -y
        crun cd ctags
        crun ./autogen.sh
        crun ./configure
        crun sudo make
        crun sudo make install
        crun cd -
        crun rm -rf ctags
    else
        cecho "Ctags has already been installed."
    fi
}

# # Ref: https://zhuanlan.zhihu.com/p/36279445
function gtags_install() {
    cecho "Installing gtags..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    if ! command -v gtags; then
        # currently the latest version is v6.6.3
        # https://www.gnu.org/software/global/download.html
        crun wget -c http://tamacom.com/global/global-6.6.3.tar.gz
        crun tar -xf global-6.6.3.tar.gz
        crun cd global-6.6.3
        crun sudo apt install automake autoconf flex bison gperf libtool libtool-bin texinfo -y
        crun sh reconf.sh
        crun ./configure
        crun make
        crun sudo make install
        crun sudo -H pip3 install pygments
        crun cd ..
        crun rm -rf global-6.6.3.tar.gz
        crun rm -rf global-6.6.3
    else
        cecho "Gtags has already been installed."
    fi
}

function font_install(){
    cecho "Installing Fonts..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    crun sudo mkdir -p ~/.local/share/fonts
    crun sudo cp ../fonts/* ~/.local/share/fonts
    crun cd ~/.local/share/fonts
    crun sudo mkfontscale
    crun sudo mkfontdir
    crun fc-cache -f -v
    crun cd -
}

function ccls_install() {
    cecho "Installing ccls..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    if ! command -v ccls ; then
        crun git clone --depth=1 --recursive https://github.com/MaskRay/ccls
        crun cd ccls
        crun wget -c http://releases.llvm.org/7.0.1/clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        crun tar -xf clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        crun cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-16.04
        crun cmake --build Release
        crun rm clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        crun rm -rf clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-16.04
        crun cd ..
        crun mkdir -p ~/Applications
        crun mv ccls ~/Applications/
        crun sudo ln -s ~/Applications/ccls/Release/ccls /usr/bin/ccls
    else
        cecho "NOTE: ccls has already been installed and won't be installed here"
    fi
}

function latex_install() {
    cecho "Installing latex..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    sudo apt install texlive -y
    sudo apt install texlive-lang-chinese -y
    sudo apt install texlive-xetex -y
    sudo apt install latexmk -y
}

function others_install(){
    cecho "Installing others..."
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cfence ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    # gnome-tweak-tool
    crun sudo apt install gnome-tweak-tool -y
    # google-chrome
    crun sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    crun wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    crun sudo apt update
    crun sudo apt install google-chrome-stable -y
    # goldendict
    # dictionary download
    # https://github.com/skywind3000/ECDICT/releases/download/1.0.28/ecdict-mdx-style-28.zip
    crun sudo apt install goldendict -y
    # netease-cloud-music
    crun wget -O netease-cloud-music.deb http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
    crun sudo dpkg -i netease-cloud-music.deb
    crun sudo apt install -f
    crun rm netease-cloud-music.deb
    # sougou-pinyin input method
    crun wget -O sogou-pinyin.deb http://pinyin.sogou.com/linux/download.php\?f\=linux\&bit\=64
    crun sudo dpkg -i sogou-pinyin.deb
    crun sudo apt install -f
    crun rm sougou-pinyin.deb
}

function confirm_install(){
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

function ubuntu_install()
{
    # Initial
    initialize
    link

    # Install by default
    common_install
    font_install
    python_install
    vim_install

    # Confirm needed install
    confirm_install tmux tmux_install
    confirm_install latex latex_install
    confirm_install ccls ccls_install
    echo "Others include: gnome-tweak | chrome | goldendict | netease-cloud-music | sougou-pinyin"
    confirm_install others others_install

    # oh_my_zsh
    oh_my_zsh_install
    link
}
