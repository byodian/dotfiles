" change the mapleader from \ to a space
let mapleader=' '

""""""""""""""""""
" basic settings 
"""""""""""""""""""

set hlsearch 	 " Highlight search results
set showmode   " always show what mode we're currently editing in
set nowrap		 " don't wrap lines
set incsearch  " Makes search act like search in modern browsers
set ignorecase " Ignore case when searching
set number 	   " Show line number
set ruler      " Always show current position
set showmode
set bg=dark		 " 显示不同的底色色调
syntax on
set tabstop=2    " a tab is two spaces
set shiftwidth=2 " number of spaces to use for autoindenting 
set expandtab    " expand tabs by default. see :help expandtab 
set colorcolumn=80 " Setting vim highlight colorcolumn 
set nolist         " don't show invisible characters by default
set clipboard=unnamed " normal OS clipboard interaction

call plug#begin('~/.vim/plugged')
Plug 'vim-utils/vim-man'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox

"""""""""""""""""""
" plugins settings 
"""""""""""""""""""

let	g:user_emmet_mode = 'n' 			" only enable normal mode function
let	g:user_emmet_leader_key = ',' " Redefine trigger key

let g:ale_fixers = ['eslint']
let g:ale_fix_on_save=1 					" Set this variable to 1 to fix files when you save them.

let g:indentLine_char = '┊'       " vim indentline settings
let g:indentLine_color_term = 239


""""""""""""""""""
" map
"""""""""""""""""""

" Moving arrund windows
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l

" Escape insert mode
inoremap jk <esc>
inoremap jj <esc>

" Search files with junegunn/fzf.vim plugin
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>H :History<CR>

map <leader>n :NERDTreeToggle<CR>
