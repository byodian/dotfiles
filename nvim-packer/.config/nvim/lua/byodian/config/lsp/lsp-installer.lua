local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"pyright",
	"html",
	-- "vuels",
	"svelte",
	"jsonls",
	"vimls",
	"tailwindcss",
	"tsserver",
	"eslint",
	-- "diagnostics",
	"stylelint_lsp",
	"lua_ls",
	"jdtls",
	"ansiblels",
	"dockerls",
	-- "yamlls",
  "volar",
	-- "remark_ls"
}

mason.setup({
	border = "rounded",
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	max_concurrent_installers = 4,
	log_level = vim.log.levels.INFO,
})

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Set up lspcofig servers
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local capabilities = require("byodian.config.lsp.handlers").capabilities

-- npm install -g ls_emmet
if not configs.ls_emmet then
	configs.ls_emmet = {
		default_config = require("byodian.config.lsp.settings.ls_emmet"),
	}
end
lspconfig.ls_emmet.setup({ capabilities = capabilities })

local opts = {}
for _, server in pairs(servers) do
	opts = {
		on_attach = require("byodian.config.lsp.handlers").default_on_attach,
		capabilities = capabilities,
	}

	if server == "jsonls" then
		local jsonls_opts = require("byodian.config.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "stylelint_lsp" then
		local stylelintplus_opts = require("byodian.config.lsp.settings.stylelintplus_lsp")
		opts = vim.tbl_deep_extend("force", stylelintplus_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require("byodian.config.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("keep", tsserver_opts, opts)
	end

	if server == "lua_ls" then
		local lua_opts = require("byodian.config.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_opts, opts)
	end

	if server == "volar" then
		local volar_opts = require("byodian.config.lsp.settings.volar")
		opts = vim.tbl_deep_extend("force", volar_opts, opts)
	end

	if server == "tailwindcss" then
		local tailwindcss_opts = require("byodian.config.lsp.settings.tailwindcss")
		opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
	end

	if server == 'eslint' then
		local eslint_opts = require("byodian.config.lsp.settings.eslint")
		opts = vim.tbl_deep_extend("force", eslint_opts, opts)
	end

	lspconfig[server].setup(opts)
end
