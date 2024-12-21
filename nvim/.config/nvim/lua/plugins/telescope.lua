if true then
  return {}
end

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
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({})
        end,
        desc = "Find In Files",
      },
    },
    opts = {
      defaults = {
        initial_mode = "normal",
        layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "top" },
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
        find_files = {
          file_ignore_patterns = { "bin", "obj", "node_modules", ".git", ".venv" },
          hidden = true,
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
