lua require 'options'
lua require 'keymaps'
lua require "autocmds"

" Automatic installation of plugin manager 
lua require 'utils'

"--------------------------------------------------------------------------
" Plugins settings
"--------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Themes
Plug 'projekt0n/github-nvim-theme'
Plug 'navarasu/onedark.nvim'
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'dracula/vim', { 'name': 'dracula' }

" File Management
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim' " for formatters and linters

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'David-Kunz/cmp-npm'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'petertriho/cmp-git'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'b0o/schemastore.nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" " https://github.com/nvim-treesitter/nvim-treesitter/issues/1111
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'p00f/nvim-ts-rainbow'
Plug 'tami5/lspsaga.nvim', { 'branch' : 'main' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Status Line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'tpope/vim-sleuth'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment' " ic ac
Plug 'sgur/vim-textobj-parameter' " i, a,
Plug 'michaeljsmith/vim-indent-object' "ii, ai, iI, aI
Plug 'whatyouhide/vim-textobj-xmlattr' " ix, ax
Plug 'wellle/targets.vim'

" code outline
Plug 'simrat39/symbols-outline.nvim'

" tmux navigation
" Plug 'christoomey/vim-tmux-navigator'

" Plugins for web development 
Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
Plug 'AndrewRadev/tagalong.vim'
Plug 'folke/zen-mode.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'machakann/vim-highlightedyank'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'itchyny/vim-cursorword'
Plug 'dstein64/vim-startuptime'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lewis6991/gitsigns.nvim'
Plug 'github/copilot.vim'
Plug 'phaazon/hop.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/which-key.nvim'
Plug 'christoomey/vim-sort-motion'
call plug#end()

lua require "config.lsp"
lua require "config.stable"
lua require "config.null-ls"
lua require "config.nvim-treesitter"
lua require "config.lualine"
lua require "config.nvim-tree"
lua require "config.telescope"
" https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
lua require "config.cmp"
lua require "which-key"
lua require "config.gitsigns"
