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
        { "<leader>am", "<cmd>MCPHub<cr>", desc = "MCPHub", mode = { "n", "v" } },
        { "<leader>aC", group = "+CodeCompanion", icon = { icon = "🤖" }, mode = { "v", "n" } },
        { "<leader>ac", ":<C-u>'<,'>CodeCompanionChat<cr>", desc = "Chat", mode = "v" },
        { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat" },
        { "<leader>aCa", "<cmd>CodeCompanionActions<cr>", desc = "Actions", mode = { "n", "v" } },
        { "<leader>aCg", ":<C-u>'<,'>CodeCompanion /commit<cr>", desc = "Commit", mode = "v" },
        { "<leader>aCc", ":<C-u>'<,'>CodeCompanionChat<cr>", desc = "Chat", mode = "v" },
        { "<leader>aCc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat" },
        { "<leader>aCd", ":<C-u>'<,'>CodeCompanion /lsp<cr>", desc = "Explain Diagnostics", mode = "v" },
        { "<leader>aCe", ":<C-u>'<,'>CodeCompanion /explain<cr>", desc = "Explain", mode = "v" },
        { "<leader>aCf", ":<C-u>'<,'>CodeCompanion /fix<cr>", desc = "Fix", mode = "v" },
        { "<leader>aCp", ":<C-u>'<,'>CodeCompanion<cr>", desc = "Prompt", mode = "v" },
        { "<leader>aCp", "<cmd>CodeCompanion<cr>", desc = "Prompt" },
        { "<leader>aCr", ":<C-u>'<,'>CodeCompanion<cr>", desc = "Rewrite", mode = "v" },
        { "<leader>aCt", ":<C-u>'<,'>CodeCompanion /tests<cr>", desc = "Tests", mode = "v" },
      },
    },
  },
}
