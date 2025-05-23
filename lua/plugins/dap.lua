return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      if not dap.adapters["pwa-node"] then
        require("dap").adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = {
              LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
              "${port}",
            },
          },
        }
      end
      if not dap.adapters["node"] then
        dap.adapters["node"] = function(cb, config)
          if config.type == "node" then
            config.type = "pwa-node"
          end
          local nativeAdapter = dap.adapters["pwa-node"]
          if type(nativeAdapter) == "function" then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

      local vscode = require("dap.ext.vscode")
      vscode.type_to_filetypes["node"] = js_filetypes
      vscode.type_to_filetypes["pwa-node"] = js_filetypes

      for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            -- skipFiles = { "<node_internals>/**", "**/node_modules/**" },
          },
          {
            name = "Attach",
            type = "pwa-node",
            request = "attach",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "**/node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            -- skipFiles = { "<node_internals>/**", "**/node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            -- skipFiles = { "<node_internals>/**", "**/node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "NPM Run",
            runtimeExecutable = "npm",
            runtimeArgs = {
              "run",
              function()
                return coroutine.create(function(dap_run_co)
                  vim.ui.input({
                    prompt = "Name of the script: ",
                    default = "",
                  }, function(scriptName)
                    coroutine.resume(dap_run_co, scriptName)
                  end)
                end)
              end,
            },
            rootPath = "${workspaceFolder}$",
            cwd = "${workspaceFolder}",
            -- skipFiles = { "<node_internals>/**", "**/node_modules/**" },
          },
        }
      end

      for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
        require("dap").configurations[language] = {
          {
            name = "Attach",
            type = "pwa-node",
            request = "attach",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            -- skipFiles = { "**/node_modules/**" },
          },
          {
            type = "pwa-chrome",
            name = "Attach - Remote Debugging",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}",
            -- skipFiles = { "**/node_modules/**" },
          },
          {
            type = "pwa-chrome",
            name = "Launch Chrome",
            request = "launch",
            url = "http://localhost:3000",
            -- skipFiles = { "**/node_modules/**" },
          },
        }
      end
    end,
  },
}
