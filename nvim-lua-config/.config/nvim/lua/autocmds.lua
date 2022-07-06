local cmd = vim.api.nvim_create_autocmd

-- Folding by filetype
-- https://yianwillis.github.io/vimcdoc/doc/usr_41.html#41.7
-- https://forum.ubuntu.com.cn/viewtopic.php?t=367858
local function fold_by_filetype()
  if vim.o.filetype == "vim" then
    vim.cmd([[set foldmethod=marker]])
  else
    vim.cmd([[set foldlevel=20]])
    vim.cmd([[set foldmethod=expr]])
    vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
  end
end

cmd({ "FileType" }, {
  callback = fold_by_filetype,
})

-- Uncomment the following to have Vim jump to the last position when
-- reopening a file
-- https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
local function find_last_position()
  vim.cmd([[
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g'\"" 
    endif
  ]])
end

cmd({ "BufReadPost" }, {
  callback = find_last_position,
})
