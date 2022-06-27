local lsp_status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
if not lsp_status_ok then
	print('Note: Please install "nvim-lsp-ts-utils" plugin')
	return
end

return {
	init_options = require("nvim-lsp-ts-utils").init_options,
	on_attach = function(client, bufnr)
		require("config.lsp.handlers").default_on_attach(client, bufnr)

		ts_utils.setup({
			enable_import_on_completion = true,

			-- update imports on file move
			update_imports_on_move = true,
			require_confirmation_on_move = true,
			watch_dir = nil,
			auto_inlay_hints = false,
		})

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local ts_options = { silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gz", ":TSLspOrganize<CR>", ts_options)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", ts_options)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", ":TSLspImportAll<CR>", ts_options)
	end,
}
