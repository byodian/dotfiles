local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	print('Note: Please install "gitsigns" plugin')
	return
end

gitsigns.setup({
	current_line_blame = false,
	current_line_blame_opts = {
		delay = 200,
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	on_attach = function(bufnr)
		local opts = { noremap = true, silent = true }
		-- Setup keymaps
		-- Navigations
		vim.api.nvim_buf_set_keymap(bufnr, "n", "]c", '<cmd>lua require"gitsigns".next_hunk()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "[c", '<cmd>lua require"gitsigns".prev_hunk()<CR>', opts)

		-- Actions
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hS", '<cmd>lua require"gitsigns".stage_hunk()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hR", '<cmd>lua require"gitsigns".reset_hunk()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', opts)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"tb",
			'<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>',
			opts
		)
	end,
})

vim.cmd([[highlight link GitSignsCurrentLineBlame Visual]])
