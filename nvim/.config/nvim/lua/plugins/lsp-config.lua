return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      setup = {
        -- fix for arm with clang lsp
        clangd = function(_, opts)
          table.insert(opts.cmd, "--query-driver=/usr/bin/arm-none-eabi-g*")
        end,
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
      },
    },
  },
}
