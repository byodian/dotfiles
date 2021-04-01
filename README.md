# 如何在 Windows Subsystem for Linux（简称 WSL）上使用 Vim 编辑器

参考 [配置 Windows 终端 & WSL 开发环境](https://byodiandev.com/how-to-setting-up-wsl/) 

近期 WSL 已经从 WSL1 升级到 WSL2，WSL 2 提高了文件系统性能并增加完全的系统调用兼容性。在同一网络环境下与 WSL1 相比，WSL2 在执行 `git clone`、`apt install` 等命令时有着更快的速度。

接下来进入主题开始配置 Vim。

## 基础设置

这一部分是 Vim 基础设置，像显示行号、语法高亮显示等等。

首先在 WSL 主目录（`~`）中添加配置文件 `.vimrc` ，将下面的内容添加进去。
```bash
set encoding=utf-8
set nocompatible
syntax on
set noerrorbells
set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
```
## dir_colors
1. 复制 .dir_colors 文件至根（`~`）文件夹
2. 添加 `eval "$(dircolors ~/.dir_colors)"` 代码至 ~/.bashrc 文件中

## 进阶设置 vim-plug

这部分会使用插件强化 Vim 编辑器。推荐使用 Vim 插件管理器管理插件，目前有几个插件管理器可供选择，比如 [vim-plug](https://github.com/junegunn/vim-plug)、[Vundle.vim](https://github.com/VundleVim/Vundle.vim) 等等。它们都提供了诸如安装、卸载和更新的功能，方便我们管理插件。

我比较推荐 [vim-plug](https://github.com/junegunn/vim-plug) 插件管理器，它设置简单，容易使用，支持超速的并行安装和更新。首先需要安装 vim-plug，参考 [官方安装步骤](https://github.com/junegunn/vim-plug#installation)。

### 安装

下载 [plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) 文件，并把它放到 **“autoload”** 目录。

终端运行以下命令，下载 **plug.vim** 文件，并且将会保存在 `~/.vim/autoload/` 路径下。

#### linux 

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Windows (PowerShell)

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

### 用法

将以下内容添加到 `~/.vimrc` 文件中。

```bash
call plug#begin('~/.vim/plugged')
// 插件应该放在这个位置
Plug 'vim-utils/vim-man'
Plug 'gruvbox-community/gruvbox'
call plug#end()
```

### 命令

vim 普通模式下运行 vim-plug 命令。

- `PlugInstall` 安装插件
- `PlugUpdate` 更新或安装插件
- `PlugUpgrade` 更新 vim-plug
- `PlugClean` 移除不在列表中的插件
- `PlugStatus` 查看插件状态

### 注意

1. vim 插件安装路径 `~/.vim/plugged`
2. `vim-plug` 配置文件 `plug.vim` 的路径为 `~/.vim/autoload`

## 插件推荐

### YouCompleteMe （YCM）

[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) Github 主页。

#### Linux 64-bit

Linux [安装步骤](https://github.com/ycm-core/YouCompleteMe#linux-64-bit)

- 添加插件信息到 `~/.vimrc` 文件中。

  ```shell
  call plug#begin('~/.vim/plugged')
  // YouCompleteMe 插件放在这个位置
  Plug 'ycm-core/YouCompleteMe'
  call plug#end()
  ```

- 在 vim 编辑器中运行下面的命令，安装插件 YCM。

  ```bash
  :PlugInstall
  ```

- 安装 cmake、vim、python3-dev

  ```bash
  sudo apt install build-essential cmake vim python3-dev
  ```

- 安装 mono-complete、go、node 和 npm

- 编译 YCM

  ```shell
  cd ~/.vim/plugged/YouCompleteMe
  python3 install.py --all
  ```

`-all` 表示安装所有的语言特性。其他可利用的参数还有：

- `--clangd-completer`，C-family 语言支持

- `--cs-completer`，c# 语言支持，需要先安装  [Mono](https://www.mono-project.com/download/stable/#download-lin) 。
- `--go-completer`，GO 语言支持，需要先安装  [Go](https://golang.org/doc/install) 。
- `--ts-completer`，Javascript 和 TypeScript 语言支持，需要先安装 [Node.js & npm](https://docs.npmjs.com/getting-started/installing-node#1-install-nodejs--npm) 。
- `--rust-completer`，Rust 语言支持。
- `--java-completer`，Java 语言支持，需要先安装 [JDK8 (version 8 required)](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) 。


#### macOS

macOS [安装步骤](https://github.com/ycm-core/YouCompleteMe#installation)

### gruvbox

vim 主题

### vim-fugitive

vim 编辑器中执行 git 命令

### nerdtree

### vim-airline

### undotree

### vim-man

### vim-polyglot

## 常见问题

### WSL vim 编辑器使用 Windows 系统的剪贴板

1. 安装 [VcXsrV](https://sourceforge.net/projects/vcxsrv/) （安装后先不要启动）
2. 开始菜单中启动 **XLaunch**
3. 使用默认选项，一路点击 **下一步** ，确保选择 **Clipboard** 选项
4. 安装结束 **XLaunch** 时，保存配置文件 **config.xlaunch**，并且启动。
5. 在 WSL 系统的 `~/.bashrc` 文件中添加如下代码，并且在终端运行 `source ~/.bashrc`    
  ```bash    
  export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"
  ```
6. 终端运行下面的命令可以查看当前环境的 IP 地址
  ```bash
  echo $DISPLAY
  ```
7. 确保 Vim 有剪贴板的支持。终端运行 `vim --version |grep clipboard` ，结果应该是  **+clipboard** ，如而不是 **-clipboard**。或者在 vim 编辑器中运行命令 `:echo has("clipboard")` ，若结果是 `0` ，表示 vim 没有剪贴板的支持。
8. 如果没有剪贴版支持，你需要安装剪贴板支持，在终端运行 `sudo apt install vim-gtk`
9. 现在你就可以使用 `*p`、`*y` 命令进入 Windows 系统的剪贴板了。或者通过添加 `set clipboard=unnamed` 到 **~/.vimrc** 文件中，设置为默认。

## 参考

- [How to Install CMake on Ubuntu 18.04 LTS](https://vitux.com/how-to-install-cmake-on-ubuntu-18-04/)
- [linux下安装cmake](https://www.jianshu.com/p/3703b1e0925e) 
- [适用于 Linux 的 Windows 子系统文档](https://docs.microsoft.com/zh-cn/windows/wsl/) 了解更多 WSL2 特点。
- [适用于 Linux 的 Windows 子系统安装指南 (Windows 10)](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10#update-to-wsl-2) 更新 WSL1 到 WSL2。
