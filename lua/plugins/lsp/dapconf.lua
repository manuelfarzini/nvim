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

    ---e Setup

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        controls = {
          enabled = false,
        },

        floating = {
          border = "rounded",
        },

        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.35 },
              { id = "watches",     size = 0.25 },
              { id = "stacks",      size = 0.25 },
              { id = "breakpoints", size = 0.15 },
            },
            position = "left",
            size = 0.30,
          },
          {
            elements = {
              { id = "repl",    size = 0.50 },
              { id = "console", size = 0.50 },
            },
            position = "bottom",
            size = 0.30,
          },
        },
      })

      -- -- toggle resize
      -- vim.api.nvim_create_autocmd("VimResized", {
      --   callback = function()
      --     dapui.close()
      --     dapui.open({ reset = true })
      --   end,
      -- })

      ---- Window options: wrap and indent long lines

      do
        local group = vim.api.nvim_create_augroup("DapUiWindowOptions", { clear = true })

        local function is_dapui_ft(ft)
          return ft == "dapui_scopes" or ft == "dapui_watches" or ft == "dapui_stacks" or ft == "dapui_breakpoints"
        end

        local function apply_winopts_for_buf(buf)
          if not vim.api.nvim_buf_is_valid(buf) then
            return
          end

          local ft = vim.bo[buf].filetype
          if not is_dapui_ft(ft) then
            return
          end

          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) == buf then
              vim.api.nvim_set_option_value("wrap", true, { win = win })
              vim.api.nvim_set_option_value("linebreak", true, { win = win })
              vim.api.nvim_set_option_value("breakindent", true, { win = win })
              vim.api.nvim_set_option_value("breakindentopt", "shift:8", { win = win })
            end
          end
        end

        vim.api.nvim_create_autocmd("FileType", {
          group = group,
          pattern = { "dapui_scopes", "dapui_watches", "dapui_stacks", "dapui_breakpoints" },
          callback = function(ev)
            vim.schedule(function()
              apply_winopts_for_buf(ev.buf)
            end)
          end,
        })

        vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
          group = group,
          callback = function()
            local buf = vim.api.nvim_get_current_buf()
            vim.schedule(function()
              apply_winopts_for_buf(buf)
            end)
          end,
        })
      end

      dap.listeners.before["event_initialized"]["dapui_config"] = function() dapui.open() end
      dap.listeners.before["event_terminated"]["dapui_config"] = function() dapui.close() end
      dap.listeners.before["event_exited"]["dapui_config"] = function() dapui.close() end

      ---- Adapters

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.exepath("codelldb"),
          args = { "--port", "${port}" },
        },
      }

      ---- Configurations

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          args = function()
            local args = vim.fn.input("Program args: ")
            return vim.split(args, " ")
          end,
          stopOnEntry = true,
          exitAfterTaskReturns = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.odin = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
      dap.configurations.zig = dap.configurations.cpp

      ---- Keymaps

      vim.keymap.set(
        "n",
        "<leader>b?",
        function() dapui.eval(nil, { enter = true, noremap = true, silent = true }) end,
        { noremap = true, silent = true, desc = "Dap inspect" }
      )
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
      vim.keymap.set(
        "n",
        "<leader>bt",
        function() dapui.toggle() end,
        { noremap = true, silent = true, desc = "Dap toggle ui" }
      )
      vim.keymap.set(
        "n",
        "<leader>bC",
        function() require("dap").repl.clear() end,
        { noremap = true, silent = true, desc = "Dap clear REPL" }
      )

      vim.keymap.set("n", "<leader>bn", dap.continue,  { noremap = true, silent = true, desc = "Dap next breakpoint" })
      vim.keymap.set("n", "[b",         dap.step_into, { noremap = true, silent = true, desc = "Dap one step in" })
      vim.keymap.set("n", "]b",         dap.step_over, { noremap = true, silent = true, desc = "Dap one step over" })
      vim.keymap.set("n", "]B",         dap.step_out,  { noremap = true, silent = true, desc = "Dap up to return" })
      vim.keymap.set("n", "<leader>br", dap.restart,   { noremap = true, silent = true, desc = "Dap restart" })
      vim.keymap.set("n", "<leader>be", dap.terminate, { noremap = true, silent = true, desc = "Dap exit" })

      --
    end,
  },
}
