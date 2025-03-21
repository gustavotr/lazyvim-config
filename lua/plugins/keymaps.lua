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
        { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions", mode = { "n", "v" } },
        { "<leader>ag", ":<C-u>'<,'>CodeCompanion /commit<cr>", desc = "Commit", mode = "v" },
        { "<leader>ac", ":<C-u>'<,'>CodeCompanionChat<cr>", desc = "Chat", mode = "v" },
        { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat" },
        { "<leader>ad", ":<C-u>'<,'>CodeCompanion /lsp<cr>", desc = "Explain Diagnostics", mode = "v" },
        { "<leader>ae", ":<C-u>'<,'>CodeCompanion /explain<cr>", desc = "Explain", mode = "v" },
        { "<leader>af", ":<C-u>'<,'>CodeCompanion /fix<cr>", desc = "Fix", mode = "v" },
        { "<leader>ap", ":<C-u>'<,'>CodeCompanion<cr>", desc = "Prompt", mode = "v" },
        { "<leader>ap", "<cmd>CodeCompanion<cr>", desc = "Prompt" },
        { "<leader>ar", ":<C-u>'<,'>CodeCompanion<cr>", desc = "Rewrite", mode = "v" },
        { "<leader>at", ":<C-u>'<,'>CodeCompanion /tests<cr>", desc = "Tests", mode = "v" },
      },
    },
  },
}
