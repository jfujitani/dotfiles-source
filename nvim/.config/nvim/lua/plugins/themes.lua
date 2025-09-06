return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      pickers = {
        enable_preview = true,
      },
    },
  },
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "catppuccin/nvim",
    opts = function(_, opts)
      local module = require("catppuccin.groups.integrations.bufferline")
      if module then
        module.get = module.get_theme
      end
      return opts
    end,
  },
}
