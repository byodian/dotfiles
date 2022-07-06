local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print('Note: Please install "nvim-lsp-installer" plugin')
	return
end

-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"pyright",
	"html",
	-- "vuels",
	"svelte",
	"jsonls",
	"cssls",
	"vimls",
	"tailwindcss",
	"tsserver",
	"eslint",
	-- "diagnostics",
	"stylelint_lsp",
	"sumneko_lua",
	"jdtls",
	"ansiblels",
	"dockerls",
	"yamlls",
	"volar",
	-- "remark_ls"
}

local settings = {
	ensure_installed = servers,
	-- automatic_installation = fase,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.setup(settings)

local capabilities = require("config.lsp.handlers").capabilities

local lspconfig_static_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_static_ok then
	print('Note: Please install "lspconfig" plugin')
	return
end

local configs = require("lspconfig.configs")
if not configs.ls_emmet then
	configs.ls_emmet = {
		default_config = require("config.lsp.settings.ls_emmet"),
	}
end
lspconfig.ls_emmet.setup({ capabilities = capabilities })

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("config.lsp.handlers").default_on_attach,
		capabilities = capabilities,
	}

	if server == "jsonls" then
		local jsonls_opts = require("config.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "stylelint_lsp" then
		local stylelintplus_opts = require("config.lsp.settings.stylelintplus_lsp")
		opts = vim.tbl_deep_extend("force", stylelintplus_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require("config.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("keep", tsserver_opts, opts)
	end

	if server == "sumneko_lua" then
		local sumneko_lua_opts = require("config.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
	end

	if server == "vuels" then
		local vuels_opts = require("config.lsp.settings.vuels")
		opts = vim.tbl_deep_extend("force", vuels_opts, opts)
	end

	if server == "tailwindcss" then
		local tailwindcss_opts = require("config.lsp.settings.tailwindcss")
		opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
	end

	lspconfig[server].setup(opts)
end
