if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

# set up proxy
set -xg http_proxy http://127.0.0.1:7890
set -xg https_proxy http://127.0.0.1:7890
