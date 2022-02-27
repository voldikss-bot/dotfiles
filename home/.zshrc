# vim:ft=sh
#!/bin/zsh
# Author: VOLDIKSS
# Date  : 2019-03-22


#=============================================================================
# antigen
#=============================================================================
source $HOME/.antigen.zsh

antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle colorize
# antigen bundle git # it has too many alias...
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
antigen bundle wfxr/forgit

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
# NOTE: this must be put after antigen apply
#=============================================================================
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gnzh"
source $ZSH/oh-my-zsh.sh
# source $HOME/.af-magic.zsh-theme    # theme
source $HOME/.aliases


#=============================================================================
# completion
#=============================================================================
# comment because ohmyzsh already set this
# autoload -U compinit && compinit
# setopt complete_in_word

#=============================================================================
# misc
#=============================================================================
export VISUAL=/usr/local/bin/nvim
# export EDITOR=/usr/local/bin/nvim
# export MANPAGER="nvim '+set ft=man' -"
export REACT_EDITOR=code

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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

# fzf integration
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#=============================================================================
# path
#=============================================================================
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# GoLang
export GOROOT=/usr/lib/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOPATH="$HOME/go"
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
# Cargo
export PATH="$HOME/.cargo/bin:$PATH"
# It would slow down zsh startup, disable it for the moment
# source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
