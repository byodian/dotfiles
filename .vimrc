call plug#begin('~/.vim/plugged')
Plug 'vim-utils/vim-man'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'preservim/nerdcommenter'
call plug#end()

" change the mapleader from \ to a space
let mapleader=' '

""""""""""""""""""
" basic settings 
"""""""""""""""""""
" Tab tab
set showmatch  " Show matching words during a search
set hlsearch 	 " Highlight search results
set showmode   " always show what mode we're currently editing in
set nowrap		 " don't wrap lines
set incsearch  " Makes search act like search in modern browsers
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
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
set nocompatible      " Disable compatibility with vi which can cause unexpected issues
filetype on           " Vim will be able to try to detect the type of file in use.
filetype plugin on    " Enable plugins and load plugin for the detected file type
set encoding=UTF-8
set scrolloff=10      " Do not let cursor scroll below or above N number of lines when scrolling.

" To move to a misspelled word, use ]s and [s
" Once the cursor is on the word, use z=, and Vim will suggest a list of alternatives that it thinks may be correct.
" If the word is correct, Use the zg command and Vim will add it to its dictionary.
" You can also mark words as incorrect using zw.
setlocal spell spelllang=en_us " turn spell checking on only in the local buffer

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" colorscheme gruvbox
colorscheme nord

"""""""""""""""""""
" plugins settings 
"""""""""""""""""""

let	g:user_emmet_mode = 'n' 			" only enable normal mode function
let	g:user_emmet_leader_key = ',' " Redefine trigger key

let g:ale_fixers = { 
\  'javascript': [ 'eslint' ],
\  'vue': [ 'eslint', 'stylelint' ]
\}
let g:ale_linters = {
\  'javascript': [ 'eslint' ],
\  'vue': [ 'eslint', 'stylelint' ]
\}
let g:ale_fix_on_save=1 					" Set this variable to 1 to fix files when you save them.

let g:indentLine_char = '┊'       " vim indentline settings
let g:indentLine_color_term = 239

""""""""""""""""""""""""
" Coc.nvm settings
"""""""""""""""""""""""

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" <silent> means do not display output.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>" use <tab> for trigger completion and navigate to the next complete item

" the <tab> could be remapped by another plugin, use :verbose imap <tab> to check if it's mapped as expected.
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" coc config
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
  \ 'coc-python',
  \ 'coc-htmlhint',
  \ 'coc-css',
  \ ]

let g:NERDTreeIgnore = ['^node_modules$']

""""""""""""""""""
" map
"""""""""""""""""""

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Escape insert mode
inoremap jk <esc>
inoremap jj <esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Search files with junegunn/fzf.vim plugin
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>H :History<CR>

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" Toggles the comment state of the selected line(s)
vmap ++  <plug>NERDCommenterToggle
nmap ++  <plug>NERDCommenterToggle
