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
      defaults = {
        ["<leader>gd"] = { name = "+diffview" },
        ["<leader>T"] = { name = "+toggle" },
      },
    },
  },
}
