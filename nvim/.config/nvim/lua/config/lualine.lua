local enable = true
if not enable then
	return
end

require("plenary.reload").reload_module("lualine", true)
require("lualine").setup({
	options = {
		-- theme = 'onedark',
		-- disabled_filetypes = { 'NvimTree' },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_x = { "encoding", "filetype" },
	},
})
