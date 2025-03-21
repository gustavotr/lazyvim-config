return {
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    opts = {
      log_level = "DEBUG",
      strategies = {
        chat = {
          adapter = "ollama",
          keymaps = {
            close = {
              modes = {
                n = "<C-w>",
                i = "<C-w>",
              },
            },
          },
        },
        inline = {
          adapter = "ollama",
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "qwen2.5-coder:7b",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
    },
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
    end,
  },
}
