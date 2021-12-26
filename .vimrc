call plug#begin('~/.vim/plugged')
Plug 'vim-utils/vim-man'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/tagalong.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-commentary'
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
set path+=**
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

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
" https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

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

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""
" Coc.nvm settings
"""""""""""""""""""""""

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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
  \ 'coc-sh'
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
noremap <silent> <c-up> <c-w>+
noremap <silent> <c-down> <c-w>-
noremap <silent> <c-left> <c-w>>
noremap <c-right> <c-w><

" Escape insert mode
inoremap jk <esc>
inoremap jj <esc>

" toggle tab
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Mappings to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Fast saving
nmap <leader>w :w!<cr>

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
nnoremap <leader>h :History<CR>

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" Toggles the comment state of the selected line(s)
vmap ++ gcc
nmap ++ gcc

" F2 renaming.
nmap <F2> <Plug>(coc-rename)

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
