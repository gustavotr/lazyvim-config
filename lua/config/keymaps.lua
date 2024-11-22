-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap.set

keymap("n", "<leader>/", "gcc", { desc = "Comment", remap = true })
keymap("x", "<leader>/", "gc", { desc = "Comment", remap = true })

keymap({ "n", "x" }, "<leader>gl", "<cmd>Gitsigns blame_line<cr>", { desc = "blame" })

-- Toggle
keymap(
  "n",
  "<leader>Tt",
  "<cmd>TroubleToggle document_diagnostics<CR>",
  { desc = "Toggle Trouble document", silent = true, noremap = true }
)
keymap("n", "<leader>TT", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble", silent = true, noremap = true })
keymap("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline", silent = true, noremap = true })

-- Navigation
keymap("n", "<leader>>", "<cmd>foldopen<CR>", { desc = "Fold Open", silent = true, noremap = true })
keymap("n", "<leader><", "<cmd>foldclose<CR>", { desc = "Fold Close", silent = true, noremap = true })

-- Debug
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Debug Step Over" })
keymap("n", "<F-10>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Debug Step Over" })
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Debug Step Into" })
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Debug Step Out" })
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", { silent = true, desc = "UI Toggle" })

-- Telescope
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Find word" })
keymap("n", "<leader>fW", function()
  require("telescope.builtin").live_grep({ cwd = require("telescope.utils").buffer_dir() })
end, { silent = true, desc = "Find word on folder" })

keymap(
  "n",
  "<Leader>D",
  ":lua require('neogen').generate()<CR>",
  { noremap = true, silent = true, desc = "Generate docs" }
)
