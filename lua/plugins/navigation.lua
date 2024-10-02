function openFileWithDefaultApp(file_path)
  local os_name = string.lower(package.config:sub(1, 1)) == "\\" and "windows" or "unix"
  local open_command

  if os_name == "windows" then
    open_command = 'start "" "' .. file_path .. '"'
  elseif os_name == "unix" then
    open_command = 'xdg-open "' .. file_path .. '"'
  else
    print("Unsupported operating system")
    return
  end

  local success, _, exit_code = os.execute(open_command)

  if not success or exit_code ~= 0 then
    print("Failed to open file")
  end
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        commands = {
          open_with_system = function(state)
            local path = state.tree:get_node().path
            openFileWithDefaultApp(path)
          end,
        },
        window = {
          mappings = {
            ["O"] = "open_with_system",
            ["l"] = "open",
            ["h"] = "close_node",
          },
        },
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
