-- https://gitghub.com/pedro757/emmet
-- npm i -g ls_emmet
return {
	cmd = { "ls_emmet", "--stdio" },
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"haml",
		"xml",
		"xsl",
		"pug",
		"slim",
		"sass",
		"stylus",
		"less",
		"sss",
		"hbs",
		"handlebars",
		"vue",
		"php",
	},
	root_dir = function()
		return vim.loop.cwd()
	end,
	settings = {},
}
