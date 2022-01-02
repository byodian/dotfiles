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
set list
set listchars=tab:▸\ ,trail:·
set foldmethod=marker
set updatetime=300    " Reduce time for highlighting other references
set redrawtime=10000  " Allow more time for loading syntax on large files
set cmdheight=2       " Give more space for display messages
set shortmess+=c      " Don't pass messages to |ins-completion-menu|.
set completeopt=menu,menuone,noselect
set cursorline
set backspace=2
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

nmap <leader>ve :edit ~/.vimrc<cr>
nmap <leader>vr :source ~/.vimrc<cr>

" toggle relativenumber
nnoremap <leader>tn :set invrelativenumber<cr>

" toggle word wrap
nnoremap <leader>tw :set wrap!<cr>

" clear and redraw screen, de-highlight, fix syntax highlighting
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>ln :set cursorline!<CR>
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap <Leader>ln :set cursorline! cursorcolumn!<CR>

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

" Themes
Plug 'morhetz/gruvbox'
call plug#end()
