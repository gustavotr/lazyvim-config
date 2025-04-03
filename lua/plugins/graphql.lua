return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "graphql-language-service-cli", -- required for graphql-lsp
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = require("lspconfig").graphql.setup({}),
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "graphql",
      },
    },
  },
}
