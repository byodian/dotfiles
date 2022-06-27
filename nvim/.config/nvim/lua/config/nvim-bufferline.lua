local enabled = true
if not enabled then
	return
end

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	print('Note: Please install "bufferline" plugin')
	return
end

bufferline.setup({
	highlights = {
		fill = {
			guibg = "#192330",
		},
		separator_selected = {
			guifg = "#282828",
		},
		separator_visible = {
			guifg = "#282828",
		},
		separator = {
			guifg = "#282828",
		},
		indicator_selected = {
			guifg = "#61afef",
		},
		pick_selected = {
			guifg = "#61afef",
		},
	},
	options = {
		numbers = "none",
		modified_icon = "●",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 25,
		max_prefix_length = 25,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_buffer_close_icons = true,
		show_close_icon = false,
		separator_style = "thin",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or " ")
				s = s .. sym .. n .. " "
			end
			return s
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
			},
		},
	},
})
