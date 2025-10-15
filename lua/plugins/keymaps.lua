return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", vim.NIL },
    },
  },

  {
    "which-key.nvim",
    opts = {
      spec = {
        { "<leader>gd", group = "+diffview" },
        { "<leader>T", group = "+toggle" },
        { "<leader>tc", group = "+coverage" },
        { "<leader>a", group = "+ai", icon = { icon = "🤖" }, mode = { "v", "n" } },
        { "<leader>ac", group = "+CodeCompanion", icon = { icon = "🤖" }, mode = { "v", "n" } },
        { "<leader>am", "<cmd>MCPHub<cr>", desc = "MCPHub", mode = { "n", "v" } },
        { "<leader>aca", "<cmd>CodeCompanionActions<cr>", desc = "Actions", mode = { "n", "v" } },
        { "<leader>acg", ":<C-u>'<,'>CodeCompanion /commit<cr>", desc = "Commit", mode = "v" },
        { "<leader>acc", ":<C-u>'<,'>CodeCompanionChat<cr>", desc = "Chat", mode = "v" },
        { "<leader>acc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat" },
        { "<leader>acd", ":<C-u>'<,'>CodeCompanion /lsp<cr>", desc = "Explain Diagnostics", mode = "v" },
        { "<leader>ace", ":<C-u>'<,'>CodeCompanion /explain<cr>", desc = "Explain", mode = "v" },
        { "<leader>acf", ":<C-u>'<,'>CodeCompanion /fix<cr>", desc = "Fix", mode = "v" },
        { "<leader>acp", ":<C-u>'<,'>CodeCompanion<cr>", desc = "Prompt", mode = "v" },
        { "<leader>acp", "<cmd>CodeCompanion<cr>", desc = "Prompt" },
        { "<leader>acr", ":<C-u>'<,'>CodeCompanion<cr>", desc = "Rewrite", mode = "v" },
        { "<leader>act", ":<C-u>'<,'>CodeCompanion /tests<cr>", desc = "Tests", mode = "v" },
      },
    },
  },
}
