return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- theme
  use("folke/tokyonight.nvim")
  use("navarasu/onedark.nvim")
  use('EdenEast/nightfox.nvim')
  use({ "projekt0n/github-nvim-theme" })

  -- Base plugins
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")

  -- File Management
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-file-browser.nvim")
  use("sudormrfbin/cheatsheet.nvim")
  use("kyazdani42/nvim-tree.lua")
  use({ "junegunn/fzf", run = "./install --bin" })
  use("junegunn/fzf.vim")

  -- Language Server Protocol
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("folke/trouble.nvim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
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
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("p00f/nvim-ts-rainbow")
  use({ "tami5/lspsaga.nvim", branch = "nvim6.0" })
  use("nvim-treesitter/nvim-treesitter-textobjects")

  -- Status Line
  use("hoob3rt/lualine.nvim")

  -- tpope plugins
  use("tpope/vim-surround")
  use("tpope/vim-commentary")
  use("tpope/vim-fugitive")
  use("tpope/vim-repeat")
  use("tpope/vim-eunuch")
  use("tpope/vim-unimpaired") -- helpful shorthand like [b ]b
  use("tpope/vim-sleuth")

  -- text objects
  use("kana/vim-textobj-user")
  use("glts/vim-textobj-comment") -- ic ac
  use("sgur/vim-textobj-parameter") -- i, a,
  use("michaeljsmith/vim-indent-object") --ii, ai, iI, aI
  use("whatyouhide/vim-textobj-xmlattr") -- ix, ax
  use("wellle/targets.vim")

  -- code outline
  use("simrat39/symbols-outline.nvim")

  -- Plugins for web development
  use({ "norcalli/nvim-colorizer.lua", branch = "color-editor" })
  use("AndrewRadev/tagalong.vim")
  use("folke/zen-mode.nvim")
  use("windwp/nvim-autopairs")
  use("machakann/vim-highlightedyank")
  use("lukas-reineke/indent-blankline.nvim")

  use("itchyny/vim-cursorword")
  use("karb94/neoscroll.nvim")
  use("dstein64/vim-startuptime")
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  use("lewis6991/gitsigns.nvim")
  use("github/copilot.vim")
  use("phaazon/hop.nvim")
  use("kevinhwang91/nvim-hlslens")
  use("akinsho/nvim-bufferline.lua")
  use("akinsho/toggleterm.nvim")
  use("folke/which-key.nvim")
  use("christoomey/vim-sort-motion")
end)