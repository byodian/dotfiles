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

# fzf preview
alias fzfpreview 'fzf --layout=reverse --multi --preview "bat --style=numbers --color=always --theme=Dracula --line-range :500 {}"'

set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

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

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end
