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

require("lspsaga").setup({ rename_prompt_prefix = "" })

require("nvim-autopairs").setup({})
require("zen-mode").setup({})

-- hop plugin
require("hop").setup({
  inclusive_jump = true,
})
vim.cmd([[
  nnoremap <leader>z :Zen<CR>
  map <c-s> <cmd>HopChar1<CR>
  noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
              \<Cmd>lua require('hlslens').start()<CR>
  noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
              \<Cmd>lua require('hlslens').start()<CR>
  noremap * *<Cmd>lua require('hlslens').start()<CR>
  noremap # #<Cmd>lua require('hlslens').start()<CR>
  noremap g* g*<Cmd>lua require('hlslens').start()<CR>
  noremap g# g#<Cmd>lua require('hlslens').start()<CR>
]])

---------------------------
require("colorizer").setup()

require("toggleterm").setup({
  open_mapping = [[<c-\>]],
})

require("cheatsheet").setup()

-- symbols_outline plugin
vim.g.symbols_outline = {
  width = 50,
  position = "left",
  auto_preview = false,
}

vim.cmd([[
  nnoremap <leader>sb <cmd>SymbolsOutline<cr>

  imap <silent><script><expr> <c-j> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
  highlight CopilotSuggestion guifg=#555555 ctermfg=8
]])

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
