"--------------------------------------------------------------------------
" Basic settings 
"--------------------------------------------------------------------------
set title
set hidden
set number
set showmatch         " Show matching words during a search
set hlsearch          " Highlight search results
set showmode          " always show what mode we're currently editing in
set incsearch         " Makes search act like search in modern browsers
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
set ignorecase        " Ignore case when searching set number            " Show line number
set ruler             " Always show current position
set bg=dark		        " 显示不同的底色色调
set showmode
set signcolumn=yes
set tabstop=2         " a tab is two spaces
set shiftwidth=2      " number of spaces to use for autoindenting 
set expandtab         " expand tabs by default. see :help expandtab 
set nojoinspaces      " don't autoinsert two spaces after '.', '?', '!' for join command
set clipboard+=unnamedplus
set encoding=UTF-8
set sidescrolloff=8
set scrolloff=10      " Do not let cursor scroll below or above N number of lines when scrolling.
set nowrap            " don't wrap lines
set mouse=a           " Enable the use of the mouse
set splitright        " Splitting a window will put the new window right of the current one.
set splitbelow
set path+=**
set confirm
set undofile
set undodir=~/.vim/undodir
set list
set listchars=tab:▸\ ,trail:·
" set cmdheight=2

set updatetime=300    " Reduce time for highlighting other references
set redrawtime=10000  " Allow more time for loading syntax on large files
set shortmess+=c      " Don't pass messages to |ins-completion-menu|.
set cursorline
syntax on
filetype on           " Vim will be able to try to detect the type of file in use.
filetype plugin indent on    " Enable plugins and load plugin for the detected file type

" attempt to speed-up vim
set ttyfast
set lazyredraw

" To move to a misspelled word, use ]s and [s
" Once the cursor is on the word, use z=, and Vim will suggest a list of alternatives that it thinks may be correct.
" If the word is correct, Use the zg command and Vim will add it to its dictionary.
" You can also mark words as incorrect using zw.
set spelllang=en,cjk            " turn spell checking on only in the local buffer
set spellsuggest=best,9         " show nine spell checking candidates at most.
set wildmenu                    " Enable auto completion menu after pressing TAB.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*/node_modules/**

"-------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader=' '

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" toggle relativenumber
nnoremap <leader>tn :set invrelativenumber<cr>

" toggle word wrap
nnoremap <leader>tw :set wrap!<cr>

" clear and redraw screen, de-highlight, fix syntax highlighting
nnoremap <leader>lh :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>ln :set cursorline!<CR>

" Escape insert mode
inoremap jk <esc>
inoremap jj <esc>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-l> :wincmd l<cr>

" resize current buffer by +/- 5 
nnoremap <M-Right> :vertical resize -5<cr>
nnoremap <M-Up> :resize +5<cr>
nnoremap <M-Down> :resize -5<cr>
nnoremap <M-Left> :vertical resize +5<cr>

" mappings to move lines {{{
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" For WSL2
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Enable sell checking
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" mappings to quickfix {{{
" quickfix list
nnoremap <c-q> :copen<cr>
nnoremap [q :cprevious<cr>
nnoremap ]q :cnext<cr>

" location quickfix list
nnoremap <leader>q :lopen<cr>
nnoremap <leader>k :lprevious<cr>
nnoremap <leader>j :lnext<cr>
"}}}

"--------------------------------------------------------------------------
" autocmd settings
"--------------------------------------------------------------------------

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
" https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Folding by filetype
" https://yianwillis.github.io/vimcdoc/doc/usr_41.html#41.7
" https://forum.ubuntu.com.cn/viewtopic.php?t=367858
function FoldByFileType()
  if &filetype=="vim"
    set foldmethod=marker
  else 
    set foldlevel=20
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
  endif
endfunction

autocmd FileType * call FoldByFileType()

"--------------------------------------------------------------------------
" Plugins settings
"--------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Themes
Plug 'navarasu/onedark.nvim'

" File Management
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ThePrimeagen/harpoon'

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
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

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" " https://github.com/nvim-treesitter/nvim-treesitter/issues/1111
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'p00f/nvim-ts-rainbow'
Plug 'tami5/lspsaga.nvim', { 'branch' : 'nvim6.0' } 
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
Plug 'christoomey/vim-tmux-navigator'

" Plugins for web development 
Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
Plug 'AndrewRadev/tagalong.vim'
Plug 'folke/zen-mode.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'vim-utils/vim-man'
Plug 'machakann/vim-highlightedyank'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'itchyny/vim-cursorword'
Plug 'karb94/neoscroll.nvim'
Plug 'dstein64/vim-startuptime'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lewis6991/gitsigns.nvim'
Plug 'github/copilot.vim'
Plug 'phaazon/hop.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

" Settings up for normal plugins {{{
" Plug Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif

highlight Cursor guifg=#f00 guibg=#657b83
highlight Comment cterm=italic gui=italic

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set colorcolumn=80
highlight ColorColumn guibg=#181818

" onedark theme {{{
lua << EOF
local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  print('Note: Please install "onedark" plugin')
  return
end

require'onedark'.setup {
  style = 'cool',
}
require('onedark').load()
EOF
" }}}

" }}}

" Plug windwp/nvim-autopairs {{{
lua << EOF
local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print('Note: Please install "nvim-autopairs" plugin')
  return
end

nvim_autopairs.setup{}
EOF
" }}}

" Plug folke/zen-mode.nvim {{{
lua << EOF
local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  print('Note: Please install "zen-mode" plugin')
  return
end

zen_mode.setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}
EOF
nnoremap <leader>z :Zen<CR>
" }}}

" Plug 'karb94/neoscroll.nvim' {{{
lua << EOF
local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  print('Note: Please install "neoscroll" plugin')
  return
end

neoscroll.setup()
EOF
" }}}

" Plug 'folke/trouble.nvim' {{{
lua << EOF
local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  print('Note: Please install "trouble" plugin')
  return
end

trouble.setup {}
EOF

" Vim Script
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }}}

" Plug lewis6991/gitsigns.nvim {{{
lua << EOF
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  print('Note: Please install "gitsigns" plugin')
  return
end

gitsigns.setup({
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 200;
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,      -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  on_attach = function(bufnr)
    local opts = { noremap = true, silent = true }
    -- Setup keymaps
    -- Navigations
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']c', '<cmd>lua require"gitsigns".next_hunk()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[c', '<cmd>lua require"gitsigns".prev_hunk()<CR>', opts)

    -- Actions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hS', '<cmd>lua require"gitsigns".stage_hunk()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hR', '<cmd>lua require"gitsigns".reset_hunk()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'tb', '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', opts)
  end
})
EOF
highlight link GitSignsCurrentLineBlame Visual
" }}}

" Plug 'phaazon/hop.nvim' {{{
lua << EOF
local status_ok, hop = pcall(require, "hop")
if not status_ok then
  print('Note: Please install "hop" plugin')
  return
end

hop.setup({
  inclusive_jump = true
})
EOF
map <c-s> <cmd>HopChar1<CR>
" }}}

" Plug 'kevinhwang91/nvim-hlslens' {{{
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>
" }}}

" Plug norcalli/nvim-colorizer.lua {{{
lua << EOF
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  print('Note: Please install "colorizer" plugin')
  return
end

colorizer.setup()
EOF
" }}}

" Plug akinsho/toggleterm.nvim {{{
lua << EOF
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  print('Note: Please install "toggleterm" plugin')
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
})
EOF
" }}}

" Plug sudormrfbin/cheatsheet.mvim {{{
lua << EOF
require('cheatsheet').setup()
EOF
" }}}
" }}}

" nvim-telescope/telescope.nvim {{{
lua << EOF
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print('Note: Please install "telescope" plugin')
  return
end

local actions = require('telescope.actions') 
telescope.load_extension('fzf')
telescope.load_extension "file_browser"

telescope.setup {
  defaults = {
    file_ignore_patterns = { "yarn.lock", "node_modules", ".git/", "dist/" },
    mappings = {
      i = {
        ["<M-d>"] = "delete_buffer",
        ["<C-/>"] = "which_key"
      },
      n = {
        ["q"] = actions.close
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
    },
    find_files = {
      show_all_files = true,
      sort_lastused = true,
      no_ignore = true,
      follow = true,
      -- theme = "dropdown"
    },
  }
}
EOF

nnoremap <leader>ff <cmd>lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <leader>ft <cmd>lua require'telescope.builtin'.git_files{ hidden = true }<cr>
nnoremap <leader>ps <cmd>lua require'telescope.builtin'.grep_string( { search = vim.fn.input("Grep for > ") } )<cr>
nnoremap <leader>fb <cmd>lua require'telescope.builtin'.buffers()<cr>
nnoremap <leader>fs <cmd>lua require'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
nnoremap <Leader>fc <cmd>lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>cb <cmd>lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>fr <cmd>lua require'telescope.builtin'.resume{}<cr>
nnoremap <leader>fg <cmd>lua require'telescope.builtin'.live_grep( { file_ignore_patterns = { '**/*.spec.js' } } )<cr>
nnoremap <leader>fh <cmd>lua require'telescope.builtin'.help_tags()<cr>
nnoremap <leader>fo <cmd>lua require'telescope.builtin'.oldfiles()<cr>
"}}}

" Plug ThePrimeagen/harpoon {{{
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>, :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
" }}}

" Plug kyazdani43/nvim-tree.lua {{{
lua << EOF
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  print('Note: Please install "nvim-tree" plugin')
  return
end

nvim_tree.setup {
  auto_close = true,
  git_hl = 1,
  indent_markers = 1,
  highlight_opened_files = 1,
  group_empty = 1,
  actions = {
    open_file = {
      quit_on_open = 1, 
    }
  },
  ignore_ft_on_setup  = { 'startify', 'dashboard' },
  view = {
    side = 'right',
    width = 50,
    hide_root_folder = false,
    number = true,
    auto_resize = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  filters = {
    dotfiles = false,
    custom = {}
  }
}
EOF

" nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFileToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
"}}}

" Plug 'hoob3rt/lualine.nvim' {{{
lua << EOF
local enable = {
  lualine = true 
}

if enable.lualine then 
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    print('Note: Please install "lualine" plugin')
    return
  end

  require('plenary.reload').reload_module('lualine', true)
  require('lualine').setup({
    options = {
      theme = 'material',
      -- theme = 'nord',
      -- theme = 'dracula',
      -- theme = 'iceberg_dark',
      -- theme = 'gruvbox_dark',
      -- theme = 'onedark',
      -- disabled_filetypes = { 'NvimTree' },
      component_separators = { left = "", right = "", },
      section_separators = { left = "", right = "", },
    },
    sections = {
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_x = {'encoding', 'filetype'},
    }
  })
end
EOF
" }}}

" Plug williamboman/nvim-lsp-installer {{{
lua << EOF
local default_on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>ga', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>gl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<space>lf', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opts)
  buf_set_keymap('n', '<space>ls', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', opts)
  buf_set_keymap('n', '<space>le', '<cmd>EslintFixAll<CR>', opts)

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>vll', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  -- Lspsage keymapings
  buf_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>Lspsaga code_action<cr>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>Lspsaga rename<cr>', opts)
  buf_set_keymap('n', 'go', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
  buf_set_keymap('n', 'gp', '<cmd>Lspsaga preview_definition<cr>', opts)
  buf_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', opts)

  -- formatting
  if 
    client.name == 'tsserver' or 
    client.name == 'vimls' or 
    client.name == 'emmet_ls' or 
    client.name == 'eslint' or
    client.name == 'tailwindcss' or 
    client.name == 'vuels' then
    client.resolved_capabilities.document_formatting = false
  else 
    client.resolved_capabilities.document_formatting = true 
  end

  -- See `:help vim.lsp.buf.formatting_seq_sync()` for documentation on any of the below functions 
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    -- vim.api.nvim_command [[autocmd BufWritePre <buffer> EslintFixAll]]
    -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    -- vim.api.nvim_command [[autocmd BufWritePre *.js,*,vue,*.ts,*.tsx EslintFixAll]]
    vim.api.nvim_command [[augroup END]]
  end

end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  print('Note: Please install "nvim-lsp-installer" plugin')
  return
end

local util = require "lspconfig/util"

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "pyright",
  "html",
  "vuels",
  "svelte",
  "jsonls",
  "emmet_ls",
  "cssls",
  "vimls",
  "tailwindcss",
  "tsserver",
  "eslint",
  "diagnostics",
  "stylelint_lsp",
  "sumneko_lua",
  "jdtls"
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
      }
    }
})

local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
if not status_ok then
  print('Note: Please install "nvim-lsp-ts-utils" plugin')
  return
end

local enhance_server_opts = {
  -- Provide settings that should only apply to the "eslintls" server
  ["tsserver"] = function(opts) 
    opts.settings = {
      init_options = ts_utils.init_options,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
      root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
    }

    opts.on_attach = function(client, bufnr)
       default_on_attach(client, bufnr)

       ts_utils.setup({
          enable_import_on_completion = true,

          -- update imports on file move
          update_imports_on_move = true,
          require_confirmation_on_move = true,
          watch_dir = nil,
       })

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      local opts = { silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end
  end,
  ["vuels"] = function(opts)
    opts.settings = {
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = "initial",
          useScaffoldSnippets = true 
        },
        languageFeatures = {
          updateImportOnFileMove = true
        },
        validation = {
          style = true,
          script = true,
          template = true
        }
      }
    }
  end,
  ["tailwindcss"] = function(opts)
    opts.settings = {
      tailwindCSS = {
        rootFontSize = 10 
      } 
    }
  end,
  ["sumneko_lua"] = function(opts)
    opts.settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        }, 
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
      }
    }
  end,
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  print('Note: Please install "cmp_nvim_lsp" plugin')
  return
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = cmp_nvim_lsp.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = default_on_attach,
    capabilities = capabilities
  }
 
  if enhance_server_opts[server.name] then
    -- Enhance the default opts with the server-specific ones
    enhance_server_opts[server.name](opts)
  end 

  if server.name == 'emmet_ls' then
    local emmet_ls_opts = {
      filetypes = { "html", "css", "typescriptreact", "javascriptreact", "javascript" },
    }
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server.name == 'stylelint_lsp' then 
    local stylelint_opts = {
      settings = {
        stylelintplus = {
          enable = true,
          autoFixOnSave = true,
          autoFixOnFormat = true,
          cssInJs = false,
          filetypes = { "css", "scss", "sass", "less", "vue", "javascriptreact", "typescriptreact", "sugarss"},
        },
      }
    }

    opts = vim.tbl_deep_extend("force", stylelint_opts, opts)
  end

  server:setup(opts)
end)
EOF
" }}}

" Plug neovim/nvim-lspconfig {{{
lua << EOF
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print('Note: Please install "lspconfig" plugin')
  return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
  print('...')
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  print('Note: Please install "cmp_nvim_lsp" plugin')
  return
end

local capabilities = cmp_nvim_lsp.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- install manually server, like: npm install -g typescript-server
local servers = { }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
" }}}

" Plug jose-elias-alvarez/null-ls.nvim {{{{
lua << EOF
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  print('Note: Please install "null-ls" plugin')
  return
end

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.prettier.with {
    -- extra_filetypes = { "toml", "solidity" },
    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  },
  formatting.black.with { extra_args = { "--fast" } },
  formatting.stylua,
  null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.code_actions.gitsigns,     
 }

null_ls.setup({ 
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        -- vim.cmd([[
        -- augroup LspFormatting
        --     autocmd! * <buffer>
        --     autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
        -- augroup END
        -- ]])
    end
  end,
})
EOF
" }}}}

" Plug nvim-treesitter {{{
lua <<EOF
local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print('Note: Please install "nvim-treesitter" plugin')
  return
end

nvim_treesitter.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { 
    'javascript',
    'jsdoc',
    'css', 
    'scss',
    'html',
    'vue',
    'typescript',
    'json',
    'tsx',
    'yaml',
    'bash',
    'lua'
  },
  ignore_install = { 'vim'},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true 
  },
  context_commentstring = {
    enable = true
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  }
}
EOF
" }}}

" Plug hrsh7th/nvim-cmp {{{
" https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
set completeopt=menu,menuone,noselect
lua << EOF
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- nvim-cmp setup
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  print('Note: Please install "luasnip" plugin')
  return
end
require('luasnip.loaders.from_vscode').lazy_load()

local status_ok, tabnine = pcall(require, "cmp_tabnine.config")
if not status_ok then
  print('Note: Please install "cmp_tabnine" plugin')
  return
end

tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placement = '..';
  ignored_file_types = {

  }
})

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- Setup nvim-cmp.
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  print('Note: Please install "cmp" plugin')
  return
end

local status_ok, cmp_git = pcall(require, "cmp_git")
if not status_ok then
  print('Note: Please install "cmp_git" plugin')
  return
end

local status_ok, cmp_npm = pcall(require, "cmp-npm")
if not status_ok then
  print('Note: Please install "cmp-npm" plugin')
  return
end

cmp_git.setup()
cmp_npm.setup()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer',
      option = {
        keyword_length = 5,
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'npm', keyword_length = 4 },
    { name = 'cmp_tabnine' },
    { name = "cmp_git" },
    { name = 'emoji' },
    { name = 'nvim_lua' }
  }),
  completion = { 
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, 
    scrollbar = "║" 
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    scrollbar = "║",
  },
  formatting = {
    -- fields = { 'abbr', 'kind' , 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
        cmp_tabnine = "[TN]",
      })[entry.source.name]
      return vim_item
    end
  },
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        buffer = "",
      })[entry.source.name]
      return vim_item
    end
  }
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s', vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        buffer = "",
      })[entry.source.name]
      return vim_item
    end
  }
})
EOF
" }}} 

" Plug 'akinsho/nvim-bufferline.lua' {{{
set termguicolors
lua << EOF
local enabled = true 

if not enabled then
  return
end

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  print('Note: Please install "bufferline" plugin')
  return
end

bufferline.setup{
  highlights = {
    fill = {
      guibg = "#282828"
    },
    separator_selected = {
      guifg = "#282828"
    },
    separator_visible = {
      guifg = "#282828"
    },
    separator = {
      guifg = "#282828"
    },
    indicator_selected = {
      guifg = "#61afef"
    },
    pick_selected = {
      guifg = "#61afef",
    },
  },
  options = {
    numbers = "none",
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 25,
    max_prefix_length = 25,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
        or (e == "warning" and " " or " " )
        s = s ..  sym .. n .. ' '
      end
      return s
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    }
  }
}
EOF

" mapping settings
nnoremap <silent> gb :BufferLinePick<CR>
nnoremap <silent> gx :BufferLinePickClose<CR>
nnoremap <silent><leader>b :BufferLineCycleNext<CR>
" }}}

" Plug tami5/lspsaga.nvim {{{
lua << EOF
local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  print('Note: Please install "lspsaga" plugin')
  return
end

lspsaga.setup{
  rename_prompt_prefix = "",
}
EOF
" }}}

" Plug lukas-reineke/indent-blankline.nvim {{{
lua << EOF
vim.opt.list = false 
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  print('Note: Please install "indent_blankline" plugin')
  return
end


indent_blankline.setup {
  space_char_blankline = " ",
  show_current_context = true,
}
EOF
" }}}

" Plug simrat39/symbols-outline.nvim {{{
lua << EOF
vim.g.symbols_outline = {
  width = 50,
  position = 'left',
  auto_preview = false
}
EOF

" mapping setting
nnoremap <leader>sb <cmd>SymbolsOutline<cr>
" }}}

" Plug github/copilot.nvim {{{
imap <silent><script><expr> <c-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
highlight CopilotSuggestion guifg=#555555 ctermfg=8
" }}}
