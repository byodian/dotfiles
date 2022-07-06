local options = {
  hidden = true,
  tabstop = 2,
  shiftwidth = 2,
  cmdheight = 2,
  pumheight = 15,
  signcolumn = "yes",
  encoding = "UTF-8",
  sidescrolloff = 8,
  scrolloff = 10,
  wrap = false,
  mouse = "a",
  splitright = true,
  splitbelow = true,
  confirm = true,
  undofile = true,
  relativenumber = true,
  undodir = os.getenv( "HOME" ) .. '/.vim/undodir', -- https://github.com/neovim/neovim/issues/15720
  completeopt = { "menu", "menuone", "noselect", "preview" },
  termguicolors = true,       -- enable true colors support
  title = true,               -- Show the current file name in the titlebar
  number = true,              -- Show line numbers
  showmatch = true,           -- Show matching words during a search
  hlsearch = true,            -- Highlight search results
  showmode = true,            -- always show what mode we're currently editing in
  incsearch = true,           -- Makes search act like search in modern browsers
  smartcase = true,           -- Case-insensitive search
  ignorecase = true,          -- Case-insensitive search
  ruler = true,               -- Show a ruler at the top of the screen
  bg = "dark",                -- the background color
  joinspaces = false,         -- Don't join lines when pressing 'J'
  clipboard = "unnamedplus",  -- Use system clipboard
  expandtab = true,           -- Expand tabs to spaces
  updatetime = 300,           -- Reduce time for highlighting other references
  redrawtime = 10000,         -- Allow more time for loading syntax on large files
  cursorline = true,          -- Highlight the current line
  ttyfast = true,             -- Faster terminal output
  lazyredraw = true,          -- Don't redraw the screen until it's actually needed
  spelllang = "en,cjk",       -- Use hunspell for spell checking
  spellsuggest = "best,9",    -- Use hunspell for spell checking
  wildmenu = true,            -- Show a menu of all wildcard matches
  wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*/node_modules/**",
  list = false
}

vim.opt.shortmess:append "c"  -- Don't pass messages to |ins-completion-menu|.
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

for k, v in pairs(options) do
  vim.opt[k] = v
end
