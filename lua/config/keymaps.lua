-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap.set

keymap("n", "<leader>/", "gcc", { desc = "Comment", remap = true })
keymap("x", "<leader>/", "gc", { desc = "Comment", remap = true })

keymap({ "n", "x" }, "<leader>gl", "<cmd>Gitsigns blame_line<cr>", { desc = "blame" })

-- Navigation
keymap({ "n", "x" }, "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
keymap({ "n", "x" }, "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
keymap({ "n", "x" }, "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
keymap({ "n", "x" }, "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })

-- Toggle
keymap(
  "n",
  "<leader>tt",
  "<cmd>TroubleToggle document_diagnostics<CR>",
  { desc = "Toggle Trouble document", silent = true, noremap = true }
)
keymap("n", "<leader>tT", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble", silent = true, noremap = true })
keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Outline", silent = true, noremap = true })

-- Debug
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Debug Step Over" })
keymap("n", "<F-10>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Debug Step Over" })
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Debug Step Into" })
keymap("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Debug Step Into" })

-- Telescope
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Find word" })
keymap("n", "<leader>fW", function()
  require("telescope.builtin").live_grep({ cwd = require("telescope.utils").buffer_dir() })
end, { silent = true, desc = "Find word on folder" })
