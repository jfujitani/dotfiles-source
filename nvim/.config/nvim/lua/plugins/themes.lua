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
}
