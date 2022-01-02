# zsh

## 安裝 zsh on ubuntu

```bash
sudo apt install zsh
```

## 安裝 oh-my-zsh

```bash
sh -c "$(wget [https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) -O -)"
```

I set `COMPLETION_WAITING_DOTS="true"` and uncommented the line in `.zshrc`.

> By turning on `COMPLETION_WAITING_DOTS` I get visual feedback from the command line that my tab completion request has been invoked and that the shell is currently loading the available options
> 

## 安裝主題

[spaceship](https://spaceship-prompt.sh/getting-started/) 

```css
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

設置 `ZSH_THEME="spaceship"` and uncommented the line in `.zshrc`

I added `SPACESHIP_PROMPT_ORDER` array to .zshrc above `source $ZSH/oh-my-zsh.sh line`.

```bash
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  dotnet        # .NET section
  ruby          # Ruby section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
```

> The SPACESHIP_PROMPT_ORDER array enables you to define which sections are enabled or disabled in the prompt, this is optional but can improve the performance of the prompt. The less sections are loaded the faster the shell will load, so I enable the sections that are of use to me.
> 

## Oh-my-zsh plugins

### git

### [zsh-sytax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

I added `zsh-syntax-highlighting` to the end of plugins array in `.zshrc`.

```bash
plugins=(git zsh-syntax-highlighting)
```

> [zsh-syntax-highlighting must always be last in the array to work correctly!](https://github.com/zsh-users/zsh-syntax-highlighting#faq)
> 

### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

I added `zsh-autosuggestions` to the plugins array in `.zshrc`.

`plugins=(git zsh-autosuggestions zsh-syntax-highlighting)`

## 添加 nvm path 至 zsh 環境

在 `.zshrc` 配置文件中添加一下代碼

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

獲取 nvm 安裝路徑，可以使用以下方式

- `type -a nvm`
- `echo $NVM_DIR`

## 安装 Nord dircolors

To automatically load Nord dircolors for every shell session, download the dir_colors file and place it as `~/.dir_colors` in your home directory.

### 激活

To activate and use Nord dircolors as your default color theme for all sessions, load the theme with **`dircolors`** by adding the following snippet to the configuration file of your shell (**`~/.bashrc`**, **`~/.zshrc`**, …):

```bash
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
```