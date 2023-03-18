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
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)
source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

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
export PATH=~/.local/.npm-global/bin:$PATH
export PATH=~/.local/n/bin:$PATH
export N_PREFIX="$HOME/.local/n"
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


#--------------------------------------------------------------#
##         Execute Script                                     ##
#--------------------------------------------------------------#

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
