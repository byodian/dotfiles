if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# alias settings
alias fd "fdfind"
alias copy "pwd | clip.exe"
alias start "explorer.exe ."

# install with apt-get
alias apt-get "sudo apt-get"

# update on one command
alias update "sudo apt-get update && sudo apt-get upgrade"

# set the default node version for new shells use
# https://github.com/jorgebucaran/nvm.fish#quickstart
set --universal nvm_default_version (cat ~/.nvmrc)

# set up proxy
set HTTPIP (cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
set PROXYHTTP "http://$HTTPIP:7890"

set -gx https_proxy $PROXYHTTP
set -gx http_proxy $PROXYHTTP
