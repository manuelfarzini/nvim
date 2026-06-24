local conform = require("conform")

conform.setup({
  formatters = {
    mojo_format = {
      append_args = { "-l", "90", "-h" },
    },
  },

  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    c3 = { "clang-format" },
    java = { "clang-format" },

    rust = { "rustfmt" },

    mojo = { "mojo_format" },

    html = { "prettier" },
    json = { "prettier" },
    xml = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    yaml = { "prettier" },
    toml = { "prettier" },

    markdown = { "markdownlint" },
    lua = { "stylua" },
    python = { "isort" },
    go = { "goimports", "gofmt" },
    php = { "phpcbf" },

    ["_"] = { "trim_whitespace" },
  },
})

vim.keymap.set(
  "n", "<leader>cb", function()
    conform.format({
      lsp_format = "fallback",
      async = false,
      timeout_ms = 8000,
    })
  end, { silent = true, desc = "Conform big file" }
)
