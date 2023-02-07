if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# Global variables
set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/.local/.npm-global/bin $PATH
set -gx PATH ~/.local/n/bin $PATH
set -gx N_PREFIX $HOME/.local/n
set -gx DOTFILES $HOME/.dotfiles
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx STOW_FOLDERS "bin,fish,nvim,tmux,zsh,powershell,bash,alacritty"


# pnpm
set -gx PNPM_HOME "~/.local/.pnpm-global"
set -gx PATH "$PNPM_HOME" $PATH

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias c "clear"
alias h "history"

if type -q exa
  alias ls "exa"
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# confirmations
alias mv "mv -i"
alias cp "cp -i"
alias ln "ln -i"
alias rm "rm -iv"
alias mkdir "mkdir -pv"

# fzf preview
alias fzfpreview 'fzf --layout=reverse --multi --preview "bat --style=numbers --color=always --theme=Dracula --line-range :500 {}"'

# set up fzf
# fish plugin variables
set -U FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --multi'
set -U FZF_ENABLE_OPEN_PREVIEW 1
set -U FZF_COMPLETE 3

# fish plugin commands
set FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git . \$dir"
set -U FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -U FZF_CD_COMMAND "fd --type d --hidden --follow --exclude .git . \$dir"
set -U FZF_OPEN_COMMAND $FZF_DEFAULT_COMMAND

# bind keys
bind \cp '~/.local/bin/tmux-sessionizer'

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
