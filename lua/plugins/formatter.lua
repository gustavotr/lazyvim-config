local util = require("conform.util")

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
      formatters = {
        prettier = {
          require_cwd = true,
          cwd = util.root_file({
            -- https://prettier.io/docs/en/configuration.html
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
            -- "package.json",
          }),
        },
      },
    },
  },
}
