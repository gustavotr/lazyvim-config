return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        json = { "prettier" },
        javascript = { "prettier", "eslint" },
        typescript = { "prettier", "eslint" },
      },
    },
  },
}
