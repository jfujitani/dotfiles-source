return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function(_, opts)
        table.insert(opts.cmd, "--query-driver=/usr/bin/arm-none-eabi-g*")
      end,
    },
  },
}
