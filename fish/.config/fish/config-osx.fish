alias npx "sudo npx"
alias ida "open -na \"IntelliJ IDEA CE\""

set -gx M_HOME ~/Downloads/apache-maven-3.9.0
set -gx PATH $M_HOME/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx STOW_FOLDERS "yabai,skhd,spacebar" $STOW_FOLDERS

# set up proxy
# set -xg http_proxy http://127.0.0.1:7890
# set -xg https_proxy http://127.0.0.1:7890
