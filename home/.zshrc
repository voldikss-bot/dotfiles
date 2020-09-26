#=============================================================================
# antigen
#=============================================================================
source $HOME/.antigen.zsh

antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle colorize
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle github
antigen bundle gradle
antigen bundle mercurial
antigen bundle pip
antigen bundle pyenv
antigen bundle pylint
antigen bundle python
antigen bundle repo

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle momo-lab/zsh-abbrev-alias
antigen bundle hlissner/zsh-autopair

antigen bundle skywind3000/z.lua
ZLUA_EXEC=$(which luajit)
export _ZL_MATCH_MODE=1
export _ZL_ADD_ONCE=1
export _ZL_CMD=j
export _ZL_HYPHEN=1
alias jc='j -c'      # 严格匹配当前路径的子路径
alias jz='j -i'      # 使用交互式选择模式
alias jf='j -I'      # 使用 fzf 对多个结果进行选择
alias jb='j -b'      # 快速回到父目录

antigen apply


#=============================================================================
# oh-my-zsh
#=============================================================================
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh


#=============================================================================
# alias
#=============================================================================
# ls
alias ll='ls -laFh'
alias la='ls -laF'
alias lh='ls -lh'
alias lR='ls -lR'
alias l='ls -l'

# vim
alias vim=nvim
alias vi=nvim

# python
alias python=python3
alias pip=pip3
alias pip_upgrade_all_packages="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip install -U"

# git
alias ga='git add'
alias gcm='git commit -v'
alias gcma='git commit --amend'
alias gco='git checkout'
alias gcl='git clone --depth 1'
alias gd='git diff'
alias gf='git fetch'
alias gr='git reset --hard HEAD'
alias gp='git push'
alias gpf='git push -f'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gs='git status'
alias gacp='git add . && git commit -m "$(date)" && git push -u origin master'

# rm 进 trash
alias rm='trash -r'

# fasd
alias v='f -e vim' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open

# fzf
alias fzfvim='vim $(fzf)'
alias fzf="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

# prettyping
# alias ping='prettyping'

# htop
alias top='htop'

# ncdu
alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'

# nnn
alias nnn='nnn -d'

# where proxy
alias proxy='export all_proxy=https://127.0.0.1:1081'
alias unproxy='unset all_proxy'

# npm registry
alias npm_taobao='npm config set registry https://registry.npm.taobao.org'
alias npm_origin='npm config set registry https://registry.npmjs.org'
alias ncu_check='ncu -u && npm i' # need `npm install -g npm-check-updates`

# arch
alias p='sudo pacman'

# dos2unix
alias dos2unix_all='find . -type f -print0 | xargs -0 dos2unix'

# cgdb nvim
# might need `echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope`
alias cgdb_nvim="gdb -p $(ps auxx | grep '[.]/build/bin/nvim' | awk '{print $2}')"

# pacman package list backup and restore
alias pacman_pkglist_backup='pacman -Qqe > $HOME/dotfiles/misc/pacman/package_list.txt'
alias pacman_pkglist_restore='for x in $(cat $HOME/dotfiles/misc/pacman/package_list.txt); do pacman -S $x; done'


#=============================================================================
# variables
#=============================================================================
# You may need to manually set your language environment
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export LC_CTYPE=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# man 着色
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
