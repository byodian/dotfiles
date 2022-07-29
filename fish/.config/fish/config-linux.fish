# alias settings
alias fd "fdfind"
alias copy "pwd | clip.exe"
alias start "explorer.exe ."

# install with apt-get
alias apt-get "sudo apt-get"

# update on one command
alias update "sudo apt-get update && sudo apt-get upgrade"

# alacritty
alias ala "alacritty.exe --config-file ~/.config/alacritty/alacritty.yml -e 'wsl.exe ~'"

# set the default node version for new shells use
# https://github.com/jorgebucaran/nvm.fish#quickstart
set --universal nvm_default_version (cat ~/.nvmrc)

# set windows system32
# set -gx PATH /mnt/c/Windows/System32 $PATH
# set -gx PATH /mnt/c/Windows $PATH

# set up proxy
set HTTPIP (cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
set PROXYHTTP "http://$HTTPIP:7890"

set -gx https_proxy $PROXYHTTP
set -gx http_proxy $PROXYHTTP
