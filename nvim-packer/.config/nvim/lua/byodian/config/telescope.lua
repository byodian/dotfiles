local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

telescope.setup({
  defaults = {
    file_ignore_patterns = { "yarn.lock", "node_modules", ".git/", "dist/" },
    preview = false,
    mappings = {
      i = {
        ["<M-d>"] = "delete_buffer",
        ["<C-/>"] = "which_key",
      },
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
    },
    find_files = {
      hidden = true,
      show_all_files = true,
      sort_lastused = true,
      no_ignore = true,
      follow = true,
      theme = "dropdown",
    },
  },
})

-- nnoremap <leader>ff <cmd>lua require'telescope.builtin'.find_files{ hidden = true }<cr>

vim.cmd([[
  nnoremap <C-p> <cmd>lua require'telescope.builtin'.find_files()<cr>
  nnoremap <leader>ft <cmd>lua require'telescope.builtin'.git_files{ hidden = true }<cr>
  nnoremap <leader>ps <cmd>lua require'telescope.builtin'.grep_string( { search = vim.fn.input("Grep for > ") } )<cr>
  nnoremap <leader>fb <cmd>lua require'telescope.builtin'.buffers()<cr>
  nnoremap <leader>fs <cmd>lua require'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
  nnoremap <Leader>fc <cmd>lua require'telescope.builtin'.git_status{}<cr>
  nnoremap <Leader>cb <cmd>lua require'telescope.builtin'.git_branches{}<cr>
  nnoremap <leader>fr <cmd>lua require'telescope.builtin'.resume{}<cr>
  nnoremap <leader>fg <cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_cursor({}))<cr>
  nnoremap <leader>fh <cmd>lua require'telescope.builtin'.help_tags()<cr>
  nnoremap <leader>fo <cmd>lua require'telescope.builtin'.oldfiles()<cr>
]])
