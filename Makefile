# vim:wrap
.PHONY: install sync base update_mirrorlist link nvim oh-my-zsh vim8 fonts nodejs python latex ccls goldendict ctags gtags rg fzf ncdu v2ray peek google-chrome netease-cloud-music sogou-pinyin kde_apps yay wps

OS := $(shell lsb_release -si)


.ONESHELL:
.SILENT:
install:
	echo 'Use `make [target]`'

.ONESHELL:
.SILENT:
yay:
	if ! command -v yay >/dev/null; then
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		cd ..
		rm -r yay


.ONESHELL:
.SILENT:
sync:
	git pull
	git push


.ONESHELL:
.SILENT:
base:
	if [ $(OS) == 'Arch' ]; then
		sudo pacman -S openssh git wget curl unrar unzip tree xclip make cmake htop ranger trash-cli zathura zsh --noconfirm
		sudo pacman -S dconf-editor lsb-release mlocate cgdb proxychains zeal perl-rename vlc fd --noconfirm
	elif [ $(OS) == 'Ubuntu' ]; then
		sudo apt install openssh-client git wget curl unrar unzip tree xclip make cmake htop ranger gnome-tweak-tool zsh -y
		sudo apt install trash-cli -y
		sudo apt install zathura -y
		sudo apt install resolvconf -y
	fi


.ONESHELL:
.SILENT:
update_mirrorlist:
	if [ $(OS) == 'Arch' ]; then
		sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
		sudo cp ./sources/arch/mirrorlist /etc/pacman.d/mirrorlist
		sudo echo "[archlinuxcn]
				   SigLevel = Optional TrustAll
				   Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux-cn/$$arch
				   " > /etc/pacman.conf
	elif [ $(OS) == 'Ubuntu' ]; then
		sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
		sudo cp ./sources/ubuntu/sources.list /etc/apt/sources.list
	fi


DOTFILES := $(shell ls -A home -I .config -I .cargo -I .cgdb)
CONFIGS := $(shell ls -A home/.config)
link:
	for f in $(DOTFILES); do ln -svf "$(PWD)/home/$$f" "$(HOME)"; done
	for f in $(CONFIGS); do ln -svf "$(PWD)/home/.config/$$f" "$(HOME)/.config"; done;


.ONESHELL:
.SILENT:
nvim: link
	if ! command -v nvim >/dev/null; then
		echo "Installing nvim..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S neovim --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			sudo apt remove vim -y
			sudo apt remove vim-gtk -y
			sudo add-apt-repository ppa:neovim-ppa/unstable -y
			sudo apt update
			sudo apt install neovim -y
		fi
	fi
	sudo pip3 install pynvim
	sudo pip3 install yapf
	sudo pip3 install flake8
	sudo pip3 install autopep8
	sudo pip3 install python-language-server
	sudo pip3 install pylint
	sudo pip3 install black
	sudo pip3 install neovim-remote
	sudo yarn global add neovim
	sudo yarn global add bash-language-server
	sudo yarn global add write-good
	sudo yarn global add markdownlint-cli
	nvim +PI +qa


.ONESHELL:
.SILENT:
oh-my-zsh:
	if [ ! -d "$(HOME)/.oh-my-zsh" ]; then
		echo "Installing oh-my-zsh..."
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		# plugins
		ln -svf "$(PWD)/home/.antigen.zsh" "$(HOME)"
		git clone https://github.com/zsh-users/zsh-autosuggestions "$(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
		# backup and linking
		mv "$(HOME)/.zshrc" "$(HOME)/.zshrc.bak"
		mv "$(HOME)/.bashrc" "$(HOME)/.inputrc.bak"
		mv "$(HOME)/.inputrc" "$(HOME)/.inputrc.bak"
		for f in $(DOTFILES); do ln -svf "$(PWD)/home/$$f" "$(HOME)"; done
		source ~/.zshrc
	fi


.ONESHELL:
.SILENT:
vim8:
	if [ $(OS) == 'Ubuntu' ]; then
		sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
	fi
	git clone https://github.com/vim/vim  vim-master --depth 1
	cd vim-master
	make distclean
	# copied from https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/vim
	./configure \
      --prefix=/usr \
      --localstatedir=/var/lib/vim \
      --with-features=huge \
      --with-compiledby='Arch Linux' \
      --enable-gpm \
      --enable-acl \
      --with-x=no \
      --disable-gui \
      --enable-multibyte \
      --enable-cscope \
      --enable-netbeans \
      --enable-perlinterp=dynamic \
      --enable-pythoninterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic \
      --enable-tclinterp=dynamic \
      --disable-canberra
	make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
	sudo make install
	sudo ln -sf /usr/local/bin/vim /usr/bin/vim


.ONESHELL:
.SILENT:
fonts:
	echo "Installing fonts..."
	sudo mkdir -p ~/.local/share/fonts
	sudo cp ../fonts/* ~/.local/share/fonts
	cd ~/.local/share/fonts
	sudo mkfontscale
	sudo mkfontdir
	fc-cache -f -v
	cd -


.ONESHELL:
.SILENT:
monaco_nerd_fonts: yay
	yay -S otf-nerd-fonts-monacob-mono --noconfirm


.ONESHELL:
.SILENT:
nodejs:
	if ! command -v node >/dev/null; then
		echo "Installing nodejs..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S node --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			curl -LO install-node.now.sh/lts
			sudo bash ./lts --yes
			rm ./lts
		fi
	fi
	if ! command -v yarn >/dev/null; then
		echo "Installing yarn..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S yarn --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
			echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
			sudo apt update -y
			sudo apt install yarn -y
			yarn --version
		fi
	fi


.ONESHELL:
.SILENT:
python:
	if ! command -v python >/dev/null; then
		echo "Installing python..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S python --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			sudo apt install python3-dev python3-pip idle3 -y
		fi
	fi


.ONESHELL:
.SILENT:
latex:
	if ! command -v latex >/dev/null; then
		echo "Installing latex..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S texlive-core texlive-langchinese --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			sudo apt install texlive -y
			sudo apt install texlive-lang-chinese -y
			sudo apt install texlive-xetex -y
			sudo apt install latexmk -y
		fi
	fi


.ONESHELL:
.SILENT:
ccls:
	if ! command -v ccls >/dev/null; then
		echo "Installing ccls..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S ccls --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			cwd:=$(PWD)
			sudo apt install zlib1g-dev -y
			mkdir -p ~/Applications
			cd ~/Applications
			git clone --depth=1 --recursive https://github.com/MaskRay/ccls
			cd ccls
			wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
			tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
			cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
			cmake --build Release
			rm -rf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04*
			sudo ln -sf ~/Applications/ccls/Release/ccls /usr/bin/ccls
			cd $(cwd)
		fi
	fi


.ONESHELL:
.SILENT:
goldendict:
	# Note: google translate for goldendict https://github.com/xinebf/google-translate-for-goldendict/
	if ! command -v goldendict >/dev/null; then
		echo "Installing goldendict..."
		# https://github.com/skywind3000/ECDICT/releases/download/1.0.28/ecdict-mdx-style-28.zip
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S goldendict --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			sudo apt install libdouble-conversion1 libqt5svg5 -y
			sudo apt install goldendict -y
		fi
	fi


.ONESHELL:
.SILENT:
ctags:
	if ! command -v ctags >/dev/null; then
		echo "Installing ctags..."
		# https://github.com/skywind3000/ECDICT/releases/download/1.0.28/ecdict-mdx-style-28.zip
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S ctags --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
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
		fi
	fi


.ONESHELL:
.SILENT:
gtags: yay
	if ! command -v gtags >/dev/null; then
		echo "Installing gtags..."
		if [ $(OS) == 'Arch' ]; then
			yay -S global --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			sudo apt install automake autoconf flex bison gperf libtool libtool-bin texinfo -y
			# The latest version is v6.6.3 for now
			# https://www.gnu.org/software/global/download.html
			wget -c http://tamacom.com/global/global-6.6.3.tar.gz
			tar -xf global-6.6.3.tar.gz
			cd global-6.6.3
			sh reconf.sh
			./configure
			make
			sudo make install
			sudo pip3 install pygments
			cd ..
			rm -rf global-6.6.3.tar.gz
			rm -rf global-6.6.3
		fi
	fi


.ONESHELL:
.SILENT:
rg:
	if ! command -v rg >/dev/null; then
		echo "Installing rg..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S ripgrep --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			wget -O rg.deb https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
			sudo dpkg -i rg.deb
			rm rg.deb
		fi
	fi


.ONESHELL:
.SILENT:
fzf:
	if ! command -v fzf >/dev/null; then
		echo "Installing fzf..."
		if [ $(OS) == 'Arch' ]; then
			# sudo pacman -S fzf --noconfirm
			git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
			~/.fzf/install
		elif [ $(OS) == 'Ubuntu' ]; then
			git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
			~/.fzf/install
		fi
	fi


.ONESHELL:
.SILENT:
ncdu:
	if ! command -v ncdu >/dev/null; then
		echo "Installing ncdu..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S ncdu --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
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
	fi


.ONESHELL:
.SILENT:
v2ray:
	if [ ! -d "/etc/v2ray" ]; then
		echo "Installing v2ray..."
		curl -LO -s https://install.direct/go.sh
		sudo bash go.sh
		rm -f go.sh
	fi


.ONESHELL:
.SILENT:
peek:
	if ! command -v peek >/dev/null; then
		echo "Installing peek..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S peek --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			sudo add-apt-repository ppa:peek-developers/stable -y
			sudo apt update
			sudo apt install peek -y
		fi
	fi


.ONESHELL:
.SILENT:
google-chrome: yay
	if ! command -v google-chrome >/dev/null; then
		echo "Installing google-chrome..."
		if [ $(OS) == 'Arch' ]; then
			yay -S google-chrome --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
			wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
			sudo apt update
			sudo apt install google-chrome-stable -y
		fi
	fi


.ONESHELL:
.SILENT:
netease-cloud-music:
	if ! command -v netease-cloud-music dev/null; then
		echo "Installing netease-cloud-music..."
		if [ $(OS) == 'Arch' ]; then
			sudo pacman -S netease-cloud-music --noconfirm
		elif [ $(OS) == 'Ubuntu' ]; then
			wget -O netease-cloud-music.deb http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
			sudo dpkg -i netease-cloud-music.deb
			sudo apt install -f
			rm netease-cloud-music.deb
		fi
	fi


.ONESHELL:
.SILENT:
sogou-pinyin:
	if [ $(OS) == 'Arch' ]; then
		sudo pacman -S fcitx-lilydjwg-git fcitx-sogoupinyin --noconfirm
	elif [ $(OS) == 'Ubuntu' ]; then
		wget -O sogou-pinyin.deb http://pinyin.sogou.com/linux/download.php\?f\=linux\&bit\=64
		sudo dpkg -i sogou-pinyin.deb
		sudo apt install -f
		rm sogou-pinyin.deb
	fi

.ONESHELL:
.SILENT:
kde_apps:
	sudo pacman -S spectacle krunner --noconfirm


.ONESHELL:
.SILENT:
wps:
	sudo pacman -S wps-office-cn wps-office-mui-zh-cn --noconfirm



.ONESHELL:
.SILENT:
cheat: yay
	yay -S cheat --noconfirm
