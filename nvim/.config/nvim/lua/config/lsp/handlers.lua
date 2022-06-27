local M = {}

M.setup = function() end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
	print('Note: Please install "cmp_nvim_lsp" plugin')
	return
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local function lsp_keymaps(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	-- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap("n", "<space>ga", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>gr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>gl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
	buf_set_keymap("n", "<space>ls", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
	buf_set_keymap("n", "<space>le", "<cmd>EslintFixAll<CR>", opts)

	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<space>vll", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	-- Lspsage keymapings
	buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	-- buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
	buf_set_keymap("n", "<space>ca", "<cmd>Lspsaga code_action<cr>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<cr>", opts)
	buf_set_keymap("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	buf_set_keymap("n", "gp", "<cmd>Lspsaga preview_definition<cr>", opts)
	buf_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", opts)

	-- formatting
	if
		client.name == "tsserver"
		or client.name == "vimls"
		or client.name == "emmet_ls"
		or client.name == "eslint"
		or client.name == "tailwindcss"
		or client.name == "vuels"
	then
		client.resolved_capabilities.document_formatting = false
	else
		client.resolved_capabilities.document_formatting = true
	end
end

M.default_on_attach = function(client, bufnr)
	lsp_keymaps(client, bufnr)
end

return M
