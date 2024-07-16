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
      },
    },
  },
}
