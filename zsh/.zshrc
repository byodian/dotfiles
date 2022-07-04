#--------------------------------------------------------------#
##          Operator System                                   ##
#--------------------------------------------------------------#
if [[ uname -eq 'Darwin' ]]; then
  source $HOME/.zshrc_mac
elif [[ uname -eq 'Linux' ]]; then
  source $HOME/.zshrc_linux
fi

#--------------------------------------------------------------#
##          Environment Vairables                             ##
#--------------------------------------------------------------#

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=j

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --multi"
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# To apply the command to CTRL-T as well 
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd (https://github.com/sharkdp/fd) instead of the default find command for listing path candidates.
# The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=YES
export DOTFILES=$HOME/.dotfiles
export XDG_CONFIG_HOME=$HOME/.config
export STOW_FOLDERS="bin,fish,nvim,tmux,zsh,powershell,bash"
#--------------------------------------------------------------#
##          Alias                                             ##
#--------------------------------------------------------------#

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias c="clear"
alias history='h'

# confirm
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -irv'
alias mkdir='mkdir -pv'

# fzf preview
alias fzfpreview='fzf --preview "bat --style=numbers --color=always --theme=Dracula --line-range :500 {}"'

#--------------------------------------------------------------#
##         Options                                            ##
#--------------------------------------------------------------#
# set -o vi # Use Vim mode on the command line

#--------------------------------------------------------------#
##         Functions                                          ##
#--------------------------------------------------------------#

#--------------------------------------------------------------#
##         Key Bindings                                       ##
#--------------------------------------------------------------#
bindkey -s ^p "tmux-sessionizer\n"

#--------------------------------------------------------------#
##         Plugin                                             ##
#--------------------------------------------------------------#

### Added by Zinit's installer                               ###
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# 快速目录跳转
zinit ice lucid wait="1"
zinit light skywind3000/z.lua

# Two regular Plugins loaded without investigation.
zinit ice lucid wait="0" atload="_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# ## Zinit Setting
# # Must Load OMZ Git library
# zinit snippet OMZL::git.zsh

# # Load Git plugin from OMZ
# zinit snippet OMZP::git
# zinit cdclear -q # <- forget completions provided up to this moment
# setopt promptsubst
# zinit snippet OMZT::robbyrussell

### End of Zinit's installer chunk                           ###

#--------------------------------------------------------------#
##         Execute Script                                     ##
#--------------------------------------------------------------#
