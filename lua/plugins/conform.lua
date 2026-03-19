return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local opt = { noremap = true, silent = true, desc = "" }

    conform.setup({
      formatters = {
        mojo_format = {
          append_args = { "-l", "90" },
        },
      },
      formatters_by_ft = {
        html = { "prettier" },
        json = { "prettier" },
        xml = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },

        markdown = { "markdownlint" },
        lua = { "stylua" },
        python = { "isort" },
        go = { "goimports", "gofmt" },
        php = { "phpcbf" },

        c = { "clang-format" },
        cpp = { "clang-format" },
        c3 = { "clang-format" },
        ino = { "clang-format" },
        java = { "clang-format" },

        mojo = { "mojo_format" },

        ["_"] = { "trim_whitespace" },
      },

      -- format_on_save = {
      --   lsp_format = "fallback",
      --   async = false,
      --   timeout_ms = 500,
      -- },
    })

    -- opt.desc = "Conform file"
    -- vim.keymap.set(
    --   "n",
    --   "<leader>cf",
    --   function()
    --     conform.format({
    --       lsp_format = "fallback",
    --       async = false,
    --       timeout_ms = 500,
    --     })
    --   end,
    --   opt
    -- )

    opt.desc = "Conform big file"
    vim.keymap.set(
      "n",
      "<leader>cb",
      function()
        conform.format({
          lsp_format = "fallback",
          async = false,
          timeout_ms = 8000,
        })
      end,
      opt
    )
  end,
}
