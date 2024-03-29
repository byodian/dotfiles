local null_ls = require("null-ls")
local builtins = null_ls.builtins

local sources = {
	builtins.formatting.prettier.with({
		-- extra_filetypes = { "toml", "solidity" },
		extra_args = {
			"--single-quote",
			"--tab-width 2",
			"--print-width 80",
			"--trailing-comma es5",
			"--bracket-spacing",
			"--arrow-parens always",
			"--semi",
			-- "--bracket-same-line",
		},
	}),
	builtins.formatting.black.with({ extra_args = { "--fast" } }),
	builtins.formatting.stylua.with({
		extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/.stylua.toml") },
	}),
	-- builtins.diagnostics.write_good,
	-- builtins.diagnostics.eslint,
	builtins.code_actions.eslint_d,
	builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
})
