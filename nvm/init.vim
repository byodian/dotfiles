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
set completeopt=menu,menuone,noselect
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
map  <leader>vr :source ~/.config/nvim/init.vim<cr>

" toggle relativenumber
nnoremap <leader>tn :set invrelativenumber<cr>

" toggle word wrap
nnoremap <leader>tw :set wrap!<cr>

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

"--------------------------------------------------------------------------
" Plugins settings
"--------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Dashboard
Plug 'glepnir/dashboard-nvim'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'npxbr/gruvbox.nvim'
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

" " https://github.com/nvim-treesitter/nvim-treesitter/issues/1111
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Status Line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'suy/vim-context-commentstring'

Plug 'windwp/nvim-autopairs'
Plug 'vim-utils/vim-man'
Plug 'miyakogi/conoline.vim'
Plug 'yamatsum/nvim-cursorline'
Plug 'mattn/emmet-vim'
Plug 'folke/zen-mode.nvim'
Plug 'AndrewRadev/tagalong.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'GustavoKatel/sidebar.nvim'
Plug 'junegunn/limelight.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'dstein64/vim-startuptime'
Plug 'folke/which-key.nvim'
Plug 'APZelos/blamer.nvim'

" TODO {{{ 
" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
" Plug 'akinsho/nvim-bufferline.lua'

" Plug 'editorconfig/editorconfig-vim'
" Plug 'wesQ3/vim-windowswap' " <leader>ww
" Plug 'justinmk/vim-sneak'
" Plug 'vimwiki/vimwiki', { 'on': ['VimwikiIndex'] }
" Plug 'stevearc/dressing.nvim'
" " Plug 'github/copilot.vim'
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

" Plug Colors {{{
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

" Plug nvim-telescope/telescope.nvim {{{
lua << EOF
local actions = require('telescope.actions') 

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "yarn.lock", "node_modules", ".git/" }
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
      mappings = {
        i = {
          ["<M-d>"] = "delete_buffer",
        },
        n = {
          ["q"] = actions.close
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

" Plug ThePrimeagen/harpoon {{{
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>, :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
" }}}

" Plug kyazdani42/nvim-tree.lua {{{
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

" Plug tpope/vim-commentary {{{
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
"}}}

" Plug 'glephir/dashboard-nvim' {{{
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

" Plug nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
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
    additional_vim_regex_highlighting = false,
  },
}
EOF
" }}}

" Plug 'windwp/nvim-autopairs' {{{
lua << EOF
require 'nvim-autopairs'.setup{}
EOF
" }}}

" Plug 'yamatsum/nvim-cursorline' {{{
let g:cursorline_timeout = 0
" }}}

" Plug 'folke/zen-mode.nvim' {{{
lua << EOF
require("zen-mode").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
EOF
nnoremap <leader>sb <cmd>SidebarNvimToggl<cr>
" }}}

" Plug 'GustavoKatel/sidebar.nvim' {{{
lua << EOF
require("sidebar-nvim").setup({})
EOF
" }}}

" Plug 'junegunn/limelight.vim' {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" }}}

" Plug 'lewis6991/gitsigns.nvim' {{{
lua << EOF
require('gitsigns').setup()
EOF
" }}}

" Plug 'karb94/neoscroll.nvim' {{{
lua << EOF
require('neoscroll').setup()
EOF
" }}}

" Plug folke/which-key.nvim {{{
lua << EOF
require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
EOF
" }}}

" Plug gelguy/wilder.nvim {{{
" call wilder#setup({'modes': [':', '/', '?']})
" call wilder#set_option('renderer', wilder#popupmenu_renderer({
"   \ 'highlighter': wilder#basic_highlighter(),
"   \ 'left': [
"   \   ' ', wilder#popupmenu_devicons(),
"   \ ],
"   \ 'right': [
"   \   ' ', wilder#popupmenu_scrollbar(),
"   \ ],
"   \ }))
" }}}

" Plug 'APZelos/blamer.nvim' {{{
let g:blamer_enabled = 1
let g:blamer_delay = 200
let g:blamer_show_in_visual_modes = 0
let g:blamer_relative_time = 1
highlight Blamer guifg=lightgrey
" }}}

" Plug coc-settings {{{
let g:coc_global_extensions = [
  \ 'coc-vetur',
  \ 'coc-tsserver',
  \ 'coc-tailwindcss',
  \ 'coc-tabnine',
  \ 'coc-stylelint',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-git',
  \ 'coc-htmlhint',
  \ 'coc-css',
  \ 'coc-sh',
  \ 'coc-eslint',
  \ 'coc-diagnostic'
  \ ]
" }}}
