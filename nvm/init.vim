"--------------------------------------------------------------------------
" Basic settings 
"--------------------------------------------------------------------------
set title
set showmatch  " Show matching words during a search
set hlsearch   " Highlight search results
set showmode   " always show what mode we're currently editing in
set incsearch  " Makes search act like search in modern browsers
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
set ignorecase " Ignore case when searching
set number 	   " Show line number
set ruler      " Always show current position
set bg=dark		 " 显示不同的底色色调
set showmode
set signcolumn=yes
syntax on
set tabstop=2    " a tab is two spaces
set shiftwidth=2 " number of spaces to use for autoindenting 
set expandtab    " expand tabs by default. see :help expandtab 
set colorcolumn=80 " Setting vim highlight colorcolumn 
set nolist         " don't show invisible characters by default
" set clipboard=unnamed " normal OS clipboard interaction
set clipboard+=unnamedplus
set nocompatible      " Disable compatibility with vi which can cause unexpected issues
filetype on           " Vim will be able to try to detect the type of file in use.
filetype plugin on    " Enable plugins and load plugin for the detected file type
set encoding=UTF-8
set sidescrolloff=8
set scrolloff=10      " Do not let cursor scroll below or above N number of lines when scrolling.
set nowrap		 " don't wrap lines
set path+=**
set mouse=a           " Enable the use of the mouse
set splitright        " Splitting a window will put the new window right of the current one.
set confirm
set undofile
set undodir=~/.vim/undodir
set list
set listchars=tab:▸\ ,trail:· 
set foldmethod=marker

" {{{
"
" }}}

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

nmap <leader>k :nohlsearch<CR>

" Escape insert mode
inoremap jk <esc>
inoremap jj <esc>	

" https://vi.stackexchange.com/questions/3814/is-there-a-best-practice-to-fold-a-vimrc-file
" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3
