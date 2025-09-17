-- bootstrap lazy.nvim, LazyVim and your plugins

-- set node version to be used by neovim
local node_path = vim.fn.systemlist("nvm which default")[1]
local node_bin = string.sub(node_path, 1, -6)
-- vim.g.node_host_prog = node_path
vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")

require("config.lazy")
