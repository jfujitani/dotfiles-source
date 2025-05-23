-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.scrolloff = 20
vim.opt.tabstop = 2 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.g.autoformat = true
vim.g.lazyvim_picker = "telescope"
return {
  {
    "nvim-lualine/lualine.nvim",
    sections = {
      lualine_z = {
        function()
          return " " .. os.date("%I:%M")
        end,
      },
    },
  },
}
