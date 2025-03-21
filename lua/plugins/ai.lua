return {
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "llama3",
        },
        inline = {
          adapter = "llama3",
        },
      },
      adapters = {
        llama3 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "llama3.2", -- Give this adapter a different name to differentiate it from the default ollama adapter
          })
        end,
      },
      keymaps = {
        close = {
          modes = {
            n = "<C-w>",
            i = "<C-w>",
          },
        },
      },
    },
  },
}
