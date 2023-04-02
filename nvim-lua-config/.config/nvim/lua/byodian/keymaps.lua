local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "<leader>vr", ":source ~/.config/nvim/init.lua<cr>", { noremap = true })

-- toggle relativenumber
keymap("n", "<leader>tn", ":set relativenumber!<cr>", opts)
-- toggle word wrap
keymap("n", "<leader>tw", ":set wrap!<cr>", opts)

-- clear and redraw screen, de-highlight, fix syntax highlighting
keymap("n", "<leader>lh", ":nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>", opts)
keymap("n", "<leader>ln", ":set cursorline!<CR>", opts)

-- escape insert mode
keymap("i", "jk", "<esc>", opts)

-- save
keymap("n", "<leader>w", ":w<cr>", opts)

-- zoom a vim pane, <C-w>= to re-balance
keymap("n", "<leader>=", ":wincmd =<cr>", opts)

-- Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
-- This is a bit of a hack, but it works.
keymap("n", "<C-j>", ":wincmd j<cr>", opts)
keymap("n", "<C-k>", ":wincmd k<cr>", opts)
keymap("n", "<C-h>", ":wincmd h<cr>", opts)
keymap("n", "<C-l>", ":wincmd l<cr>", opts)

-- resize current buffer by +/- 5
keymap("n", "<M-Right>", ":vertical resize -5<cr>", opts)
keymap("n", "<M-Left>", ":vertical resize +5<cr>", opts)
keymap("n", "<M-Up>", ":resize +5<cr>", opts)
keymap("n", "<M-Down>", ":resize -5<cr>", opts)

-- move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- quickfix list
keymap("n", "<C-q>", ":copen<cr>", opts)
keymap("n", "[q", ":cprevious", opts)
keymap("n", "]q", ":cnext", opts)

-- location quickfix list
keymap("n", "<leader>k", "lprevious", opts)
keymap("n", "<leader>j", "lnext", opts)
keymap("n", "<leader>q", ":lopen", opts)

-- Esc terminates insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

keymap("n", "<C-n>", ":Ex<CR>", opts)
