local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print('Note: Please install "nvim-tree" plugin')
	return
end

nvim_tree.setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	ignore_ft_on_setup = { "startify", "dashboard" },
	view = {
		side = "right",
		width = '100%',
		centralize_selection = true,
		hide_root_folder = false,
		number = false,
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
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
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
