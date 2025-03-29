return {
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({ cwd = "~/.config/nvim/lua/plugins" })
				end,
				desc = "Find Plugin File",
			},
		},
		opts = {
			defaults = {
				initial_mode = "insert",
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				winblend = 0,
			},
			pickers = {
				live_grep = {
					file_ignore_patterns = { "bin", "obj", "node_modules", ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		keys = {
			{
				"<leader>fB",
				":Telescope file_browser path=%:p:h=%:p:h<cr>",
				desc = "File Browser",
			},
		},
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
}
