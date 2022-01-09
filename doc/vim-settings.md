# Vim 配置

## 插件管理工具 [vim-plug](https://github.com/junegunn/vim-plug)

**linux 安装命令**

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

终端运行此命令后，可能出现错误提示： `curl: (7) Failed to connect to [raw.githubusercontent.com](<http://raw.githubusercontent.com/>) port 443: Connection refused`

原因可能是 [raw.githubusercontent.com](http://raw.githubusercontent.com) 的域名解析被污染，无法访问，可以通过修改系统 hosts 文件解决 DNS 域名解析污染问题。

### windows(PowerShell) 安装命令

```bash
md ~\.vim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\.vim\autoload\plug.vim"
  )
)
```

## [nerd fonts](https://nerdfonts.com/)

为 vim 插件增加文件类型 icons ，例如 NERDTree, vim-aline, CtrlP, unite, Denite, lightline, vim-startify。

### 安装脚本

**安装所有字体（不推荐）**

```bash
git clone git@github.com:ryanoasis/nerd-fonts.git --depth 1 # 

./install.sh # Requires cloning the repo as of now

./install.ps1 # or, in Powershell(Windows only)
```

**安装单个字体**

```bash
./install.sh <FontName>

# for example
./install.sh Hack 
./install.sh HeavyData
```

**Homebrew Fonts**

Best option if on macOS and want to use Homebrew.

All fonts are available via [Homebrew Cask Fonts](https://github.com/Homebrew/homebrew-cask-fonts) on macOS (OS X)

```bash
brew tap homebrew/cask-fonts # You only need to do this once!
brew install --cask font-hack-nerd-font
```

windows 端手动安装字体的下载链接：[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

## 插件推荐

1. vim-polyglot - syntax highlighting
2. ale - linting your code with ESLint
3. Fzf.vim
4. Coc.nvim

### Fuzzy.vim

- :Files
- :Buffers
- :History

**open the Selected file**

- ctrl-t - in a new tab
- ctrl-x - in a horizontal split
- ctrl-v - in a vertical split
- enter - in the current window

**Moving between the searched files**

- ctrl-p
- ctrl-n

**Searching for tags**

- :BTags - allows you to search for tags in the current buffer. It doesn't require a tags file, and is great for jumping between methods quickly
- :Tags  - allows you to perform project wide search for tags, but it does require a tags file.

### Commenting js code inside HTML files #60

[https://github.com/tpope/vim-commentary/issues/60](https://github.com/tpope/vim-commentary/issues/60)

TODO