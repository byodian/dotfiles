if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias la "ls -A"
alias ll "ls -l"
alias c "clear"
alias start "explorer.exe ."
alias h "history"

# confirmations
alias mv "mv -i"
alias cp "cp -i"
alias ln "ln -i"
alias rm "rm -iv"
alias mkdir "mkdir -pv"

set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# set up fzf
# set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
# set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set fzf_fd_opts --hidden --exclude=.git

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end
