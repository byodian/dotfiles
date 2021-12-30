"--------------------------------------------------------------------------
" Basic settings 
"--------------------------------------------------------------------------
set title
set hidden
set showmatch         " Show matching words during a search
set hlsearch          " Highlight search results
set showmode          " always show what mode we're currently editing in
set incsearch         " Makes search act like search in modern browsers
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
set ignorecase        " Ignore case when searching
set number            " Show line number
set ruler             " Always show current position
set bg=dark		        " 显示不同的底色色调
set showmode
set signcolumn=yes
set tabstop=2         " a tab is two spaces
set shiftwidth=2      " number of spaces to use for autoindenting 
set expandtab         " expand tabs by default. see :help expandtab 
set nolist            " don't show invisible characters by default
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
set foldmethod=marker
set updatetime=300    " Reduce time for highlighting other references
set redrawtime=10000  " Allow more time for loading syntax on large files
syntax on
filetype on           " Vim will be able to try to detect the type of file in use.
filetype plugin on    " Enable plugins and load plugin for the detected file type

" attempt to speed-up vim
set ttyfast
set lazyredraw

" To move to a misspelled word, use ]s and [s
" Once the cursor is on the word, use z=, and Vim will suggest a list of alternatives that it thinks may be correct.
" If the word is correct, Use the zg command and Vim will add it to its dictionary.
" You can also mark words as incorrect using zw.
setlocal spell spelllang=en_us " turn spell checking on only in the local buffer
set wildmenu                   " Enable auto completion menu after pressing TAB.
set wildmode=list:longest      " Make wildmenu behave like similar to Bash completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*/node_modules/**

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
" https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader=' '

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" clear and redraw screen, de-highlight, fix syntax highlighting
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

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

" move line
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" toggle relativenumber
nnoremap <leader>tn :set invrelativenumber<cr>

" toggle word wrap
nnoremap <leader>tw :set wrap!<cr>

" nnoremap <leader>x :!chmod +x %<cr>

" https://vi.stackexchange.com/questions/3814/is-there-a-best-practice-to-fold-a-vimrc-file
" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3

"--------------------------------------------------------------------------
" Plugins settings
"--------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Dashboard
Plug 'glepnir/dashboard-nvim'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'npxbr/gruvbox.nvim'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'arcticicestudio/nord-vim'

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
Plug 'onsails/lspkind-nvim'
Plug 'creativenull/diagnosticls-configs-nvim'

" TODO {{{
" Completion
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'David-Kunz/cmp-npm'

" " Custom Text Objects
" Plug 'michaeljsmith/vim-indent-object' " gcii gcaI
" Plug 'kana/vim-textobj-user'

" " Custom Motions
" Plug 'christoomey/vim-sort-motion' " gsip gsii
" Plug 'tommcdo/vim-exchange' " cxiw ., cxx ., cxc

" " tmux plugins
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'preservim/vimux'

" " https://github.com/nvim-treesitter/nvim-treesitter/issues/1111
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Plug 'MaxMEllon/vim-jsx-pretty' " fix indentation in jsx until treesitter can
" Plug 'jxnblk/vim-mdx-js'
" " Plug 'code-biscuits/nvim-biscuits'
" }}}

" Status Line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug  'tpope/vim-repeat'
" Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'suy/vim-context-commentstring'

" TODO {{{ 
" Plug 'editorconfig/editorconfig-vim'
" " Plug 'APZelos/blamer.nvim'
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'karb94/neoscroll.nvim'
" Plug 'vimwiki/vimwiki', { 'on': ['VimwikiIndex'] }
" Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
" Plug 'machakann/vim-highlightedyank'
" " Plug 'folke/which-key.nvim'
" Plug 'wesQ3/vim-windowswap' " <leader>ww
" Plug 'justinmk/vim-sneak'
" " Plug 'tweekmonster/startuptime.vim'
" Plug 'dstein64/vim-startuptime'
" Plug 'akinsho/nvim-bufferline.lua'
" Plug 'windwp/nvim-autopairs'
" Plug 'miyakogi/conoline.vim'
" " Plug 'github/copilot.vim'
" Plug 'yamatsum/nvim-cursorline'
" Plug 'mattn/emmet-vim'
" Plug 'GustavoKatel/sidebar.nvim'

" Plug 'folke/zen-mode.nvim'
" Plug 'junegunn/limelight.vim'
" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'stevearc/dressing.nvim'

" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" }}}
call plug#end()

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif

let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula

highlight Cursor guifg=#f00 guibg=#657b83
highlight Comment cterm=italic gui=italic

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set colorcolumn=80
highlight ColorColumn guibg=#181818
" }}}

" nvim-telescope/telescope.nvim {{{
lua << EOF
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "yarn.lock" }
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
      -- theme = "dropdown",
      -- previewer = false,
      mappings = {
        i = {
          ["<M-d>"] = "delete_buffer",
        }
      }
    }
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
EOF
nnoremap <leader>ps :lua require('telescope.builtin').grep_string( { search = vim.fn.input("Grep for > ") } )<cr>
nnoremap <leader>ff :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <Leader>fs :lua require'telescope.builtin'.file_browser{ cwd = vim.fn.expand('%:p:h') }<cr>
nnoremap <leader>fs <cmd>lua require 'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
nnoremap <Leader>fc :lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>cb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>fr :lua require'telescope.builtin'.resume{}<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { '**/*.spec.js' } } )<cr>
" nnoremap <leader>fgi <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { vim.fn.input("Ignore pattern > ") } } )<cr>
nnoremap <leader>fgd :lua require'telescope.builtin'.live_grep{ search_dirs = { 'slices/admin' } }
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"}}}

" ThePrimeagen/harpoon {{{
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>, :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
" }}}


" kyazdani42/nvim-tree.lua {{{
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
" let g:nvim_tree_auto_close = 1
" let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_group_empty = 1
" let g:nvim_tree_lsp_diagnostics = 1

lua << EOF
require'nvim-tree'.setup {
  auto_close = true,
  -- lsp_diagnostics = true,
  ignore_ft_on_setup  = { 'startify', 'dashboard' },
}
EOF

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
"}}}

" Plug 'hoob3rt/lualine.nvim' {{{
lua << EOF
require('plenary.reload').reload_module('lualine', true)
require('lualine').setup({
  options = {
    theme = 'dracula',
    disabled_types = { 'NvimTree' }
  },
  sections = {
    lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {},
  }
})
EOF
" }}}

" tpope/vim-commentary {{{
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
"}}}

" 'glephir/dashboard-nvim' {{{
let g:dashboard_default_executive ='telescope'
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>ct :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fg :DashboardFindWord<CR>
nnoremap <silent> <Leader>fm :DashboardJumpMark<CR>
nnoremap <silent> <Leader>nf :DashboardNewFile<CR>
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC n f',
\ 'change_colorscheme' : 'SPC c t',
\ 'find_word'          : 'SPC f g',
\ 'book_marks'         : 'SPC f m',
\ }
let s:header = [
    \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ '',
    \ '                 [ @byodian ]                 ',
    \ ]
let s:footer = []
let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer
" }}}

" neovim/nvim-lspconfig {{{
" npm i -g typescript typescript-language-server
lua << EOF
local util = require "lspconfig/util"
require 'lspconfig'.tsserver.setup{
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
    --[=====[ 
    handlers = {
      ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
        local ignore_codes = { 80001, 7016 };
        if params.diagnostics ~= nil then
          local idx = 1
          while idx <= #params.diagnostics do
            if vim.tbl_contains(ignore_codes, params.diagnostics[idx].code) then
              table.remove(params.diagnostics, idx)
            else
              idx = idx + 1
            end 
          end
        end
        vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
      end,
    },
    --]=====]
}
EOF

lua << EOF
-- npm install -g diagnostic-languageserver eslint_d prettier_d_slim prettier
local function on_attach(client)
  print('Attached to ' .. client.name)
end
local dlsconfig = require 'diagnosticls-configs'
dlsconfig.init {
  default_config = false,
  format = true,
  on_attach = on_attach,
}
local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier = require 'diagnosticls-configs.formatters.prettier'
prettier.requiredFiles = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.toml',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
  }
dlsconfig.setup {
  ['javascript'] = {
    linter = eslint,
    formatter = { prettier }
  },
  ['javascriptreact'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['css'] = {
    formatter = prettier
  },
  ['html'] = {
    formatter = prettier
  },
}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gca   <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>fo <cmd>lua vim.lsp.buf.formatting()<CR>

" autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.css lua vim.lsp.buf.formatting()

lua << EOF
require 'trouble'.setup {}
EOF

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }}}
