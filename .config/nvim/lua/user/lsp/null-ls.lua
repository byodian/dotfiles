local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	print('Note: Please install "null-ls" plugin')
	return
end

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
			-- "--no-semi",
			-- "--bracket-same-line",
		},
	}),
	builtins.formatting.black.with({ extra_args = { "--fast" } }),
	builtins.formatting.stylua,
	builtins.diagnostics.write_good,
	-- builtins.diagnostics.eslint,
	builtins.code_actions.eslint_d,
	builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
})
