lua require 'byodian.options'
lua require 'byodian.keymaps'
lua require 'byodian.autocmds'

" Automatic installation of plugin manager 
lua require 'byodian.utils'

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'folke/trouble.nvim'
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
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'kyazdani42/nvim-web-devicons'

" tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter' " i, a,
Plug 'michaeljsmith/vim-indent-object' "ii, ai, iI, aI
Plug 'whatyouhide/vim-textobj-xmlattr' " ix, ax

" tmux navigation
" Plug 'christoomey/vim-tmux-navigator'

" Plugins for web development 
Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
Plug 'AndrewRadev/tagalong.vim'
Plug 'windwp/nvim-autopairs'
Plug 'machakann/vim-highlightedyank'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'dstein64/vim-startuptime'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

lua require 'byodian.config'
