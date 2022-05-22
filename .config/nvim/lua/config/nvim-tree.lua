local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print('Note: Please install "nvim-tree" plugin')
	return
end

nvim_tree.setup({
	-- git_hl = true,
	-- indent_markers = 1,
	-- highlight_opened_files = 1,
	-- group_empty = 1,
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	ignore_ft_on_setup = { "startify", "dashboard" },
	view = {
		side = "right",
		width = 50,
		hide_root_folder = false,
		number = true,
		auto_resize = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
})
