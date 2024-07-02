-- bootstrap lazy.nvim, LazyVim and your plugins

-- set node version to be used by neovim
local home_dir = "/home/gustavotr/"
local node_bin = ".nvm/versions/node/v20.11.1/bin"
vim.g.node_host_prog = home_dir .. node_bin .. "/node"
vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")

require("config.lazy")
