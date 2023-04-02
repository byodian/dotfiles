return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- theme
  use("folke/tokyonight.nvim")
  use("navarasu/onedark.nvim")
  use("EdenEast/nightfox.nvim")
  use({ "projekt0n/github-nvim-theme" })
  use("Mofiqul/dracula.nvim")

  -- Base plugins
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")

  -- File Management
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-file-browser.nvim")
  use({ "junegunn/fzf", run = "./install --bin" })
  use("junegunn/fzf.vim")

  -- Language Server Protocol
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("folke/trouble.nvim")
  use("jose-elias-alvarez/null-ls.nvim")

  -- Completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("David-Kunz/cmp-npm")
  use({
    "tzachar/cmp-tabnine",
    run = "./install.sh",
  })
  use("petertriho/cmp-git")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-emoji")
  use("b0o/schemastore.nvim")

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1111
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use("nvim-treesitter/nvim-treesitter-textobjects")

  -- tpope plugins
  use("tpope/vim-surround")
  use("tpope/vim-commentary")
  use("tpope/vim-repeat")
  use("tpope/vim-fugitive")

  -- text objects
  use("kana/vim-textobj-user")
  use("sgur/vim-textobj-parameter") -- i, a,
  use("michaeljsmith/vim-indent-object") --ii, ai, iI, aI
  use("whatyouhide/vim-textobj-xmlattr") -- ix, ax

  -- Plugins for web development
  use({ "norcalli/nvim-colorizer.lua", branch = "color-editor" })
  use("AndrewRadev/tagalong.vim")
  use("windwp/nvim-autopairs")
  use("machakann/vim-highlightedyank")
  use("lukas-reineke/indent-blankline.nvim")

  use("dstein64/vim-startuptime")
  use("lewis6991/gitsigns.nvim")
  use("github/copilot.vim")
  use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
end)
