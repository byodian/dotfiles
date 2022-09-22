-- Make it obvious where 80 characters is
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"
vim.cmd([[
  highlight ColorColumn guibg=#181818
  highlight Cursor guifg=#f00 guibg=#657b83
  highlight Comment cterm=italic gui=italic
]])

require("nightfox").setup({
  options = {
    styles = {
      -- keywords = "bold",
      -- types = "italic,bold",
      -- strings = 'italic',
      comments = "italic",
      -- functions = "bold",
      numbers = "bold",
    },
  },
})

vim.cmd([[colorscheme dracula]])

require("nvim-autopairs").setup({})

require("colorizer").setup()
require("toggleterm").setup({
  open_mapping = [[<c-\>]],
})

-- trouble plugin
require("trouble").setup({})
vim.cmd([[
  nnoremap <leader>xx <cmd>TroubleToggle<cr>
  nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
  nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
  nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
  nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
  nnoremap gR <cmd>TroubleToggle lsp_references<cr>
]])

-- indent_blankline plugin
require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
})
