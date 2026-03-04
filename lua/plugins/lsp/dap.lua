---@diagnostic disable: undefined-global
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },

    ---- Setup
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.before["event_initialized"]["dapui_config"] = function() dapui.open() end
      dap.listeners.before["event_terminated"]["dapui_config"] = function() dapui.close() end
      dap.listeners.before["event_exited"]["dapui_config"] = function() dapui.close() end

      ---- Adapters

      -- codelldb
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.exepath("codelldb"),
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
          exitAfterTaskReturns = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
      dap.configurations.zig = dap.configurations.cpp

      -- keymaps
      vim.keymap.set("n", "<leader>b?", function() dapui.eval(nil, { enter = true, noremap = true, silent = true }) end)
      vim.keymap.set(
        "n",
        "<leader><leader>b",
        dap.toggle_breakpoint,
        { noremap = true, silent = true, desc = "Dap toggle breakpoint" }
      )
      vim.keymap.set(
        "n",
        "<leader>bc",
        dap.run_to_cursor,
        { noremap = true, silent = true, desc = "Dap run to cursor" }
      )
      vim.keymap.set("n", "<leader>bn", dap.continue, { noremap = true, silent = true, desc = "Dap next breakpoint" })
      vim.keymap.set("n", "[b", dap.step_into, { noremap = true, silent = true, desc = "Dap one step in" })
      vim.keymap.set("n", "]b", dap.step_over, { noremap = true, silent = true, desc = "Dap one step over" })
      vim.keymap.set("n", "]B", dap.step_out, { noremap = true, silent = true, desc = "Dap up to return" })
      vim.keymap.set("n", "<leader>br", dap.restart, { noremap = true, silent = true, desc = "Dap restart" })
      vim.keymap.set("n", "<leader>be", dap.terminate, { noremap = true, silent = true, desc = "Dap exit" })
      vim.keymap.set(
        "n",
        "<leader>bt",
        function() dapui.toggle() end,
        { noremap = true, silent = true, desc = "Dap toggle ui" }
      )

      --
    end,
  },
}
