local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})
Byodian = augroup('Byodian', {})

-- Folding by filetype
-- https://yianwillis.github.io/vimcdoc/doc/usr_41.html#41.7
-- https://forum.ubuntu.com.cn/viewtopic.php?t=367858
autocmd({ 'FileType' }, {
  callback = function()
    if vim.o.filetype == "vim" then
      vim.cmd([[set foldmethod=marker]])
    else
      vim.cmd([[set foldlevel=20]])
      vim.cmd([[set foldmethod=expr]])
      vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
    end
  end,
})

-- Uncomment the following to have Vim jump to the last position when
-- reopening a file
-- https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
autocmd({ 'BufReadPost' }, {
  callback = function()
    vim.cmd([[
      if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal! g'\"" 
      endif
    ]])
  end,
})

autocmd({ 'BufWritePre' }, {
  group = Byodian,
  pattern = '*.tsx,*.ts,*.jsx,*.js,*.json,*.yaml,*.yml,*.vue',
  command = 'EslintFixAll'
})

autocmd({ 'TextYankPost' }, {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})
