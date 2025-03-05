return {
  {
    "robitx/gp.nvim",
    config = function()
      local conf = {
        -- For customization, refer to Install > Configuration in the Documentation/Readme
        chat_confirm_delete = false,
        default_command_agent = "Llama3.2",
        default_chat_agent = "Llama3.2",
        providers = {
          -- secrets can be strings or tables with command and arguments
          -- secret = { "cat", "path_to/openai_api_key" },
          -- secret = { "bw", "get", "password", "OPENAI_API_KEY" },
          -- secret : "sk-...",
          -- secret = os.getenv("env_name.."),
          ollama = {
            endpoint = "http://localhost:11434/v1/chat/completions",
          },
        },
        agents = {
          {
            name = "ChatGPT4o",
            disable = true,
          },
          {
            name = "ChatGPT4o-mini",
            disable = true,
          },
          {
            name = "ChatOllamaLlama3.1-8B",
            disable = true,
          },
          {
            provider = "ollama",
            name = "Llama3.2",
            chat = true,
            command = true,
            -- string with model name or table with model name and parameters
            model = {
              model = "llama3.2",
              temperature = 0.4,
              top_p = 1,
              min_p = 0.05,
            },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").code_system_prompt,
          },
          {
            provider = "ollama",
            name = "Deepseek-r1",
            chat = true,
            command = true,
            -- string with model name or table with model name and parameters
            model = {
              model = "deepseek-r1:1.5b",
              temperature = 0.4,
              top_p = 1,
              min_p = 0.05,
            },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").code_system_prompt,
          },
        },
        hooks = {
          -- example of making :%GpChatNew a dedicated command which
          -- opens new chat with the entire current buffer as a context
          BufferChatNew = function(gp, _)
            -- call GpChatNew command in range mode on whole buffer
            vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
          end,
          UnitTests = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please respond by writing table driven unit tests for the code above."
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.vnew, agent, template)
          end,
        },
      }
      require("gp").setup(conf)
      require("which-key").add({
        -- VISUAL mode mappings
        -- s, x, v modes are handled the same way by which_key
        {
          mode = { "v" },
          nowait = true,
          remap = false,
          { "<C-g><C-t>", ":<C-u>''>GpChatNew tabnew<cr>", desc = "ChatNew tabnew" },
          { "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit" },
          { "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", desc = "ChatNew split" },
          { "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append" },
          { "<C-g>b", ":<C-u>'<,'>GpBufferChatNew<cr>", desc = "BufferChatNew" },
          { "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" },
          { "<C-g>g", group = "generate into new .." },
          { "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" },
          { "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" },
          { "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" },
          { "<C-g>gt", ":<C-u>'<,'>GpUnitTests<cr>", desc = "Unit Tests" },
          { "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" },
          { "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" },
          { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
          { "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
          { "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" },
          { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
          { "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat" },
          { "<C-g>w", group = "Whisper" },
          { "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Whisper Append" },
          { "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Whisper Prepend" },
          { "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Whisper Enew" },
          { "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Whisper New" },
          { "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Whisper Popup" },
          { "<C-g>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Whisper Rewrite" },
          { "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
          { "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
          { "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", desc = "Whisper" },
          { "<C-g>x", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext" },
        },

        -- NORMAL mode mappings
        {
          mode = { "n" },
          nowait = true,
          remap = false,
          { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
          { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
          { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
          { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
          { "<C-g>b", "<cmd>GpBufferChatNew<cr>", desc = "BufferChatNew" },
          { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
          { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
          { "<C-g>g", group = "generate into new .." },
          { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
          { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
          { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
          { "<C-g>gt", "<cmd>GpUnitTests<cr>", desc = "Unit Tests" },
          { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
          { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
          { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
          { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
          { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
          { "<C-g>w", group = "Whisper" },
          { "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
          { "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
          { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
          { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
          { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
          { "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
          { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
          { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
          { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
          { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
        },

        -- INSERT mode mappings
        {
          mode = { "i" },
          nowait = true,
          remap = false,
          { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
          { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
          { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
          { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
          { "<C-g>b", "<cmd>GpBufferChatNew<cr>", desc = "BufferChatNew" },
          { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
          { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
          { "<C-g>g", group = "generate into new .." },
          { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
          { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
          { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
          { "<C-g>gt", "<cmd>GpUnitTests<cr>", desc = "Unit Tests" },
          { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
          { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
          { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
          { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
          { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
          { "<C-g>w", group = "Whisper" },
          { "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
          { "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
          { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
          { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
          { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
          { "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
          { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
          { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
          { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
          { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
        },
      })
      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  },
}
