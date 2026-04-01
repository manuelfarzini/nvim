---@diagnostic disable: undefined-global
return {
  {

    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "neovim/nvim-lspconfig",
    },

    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          backdrop = 100,
          width = 0.85,
          height = 0.95,
          icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
          },
        },
      })

  ---@diagnostic disable-next-line: missing-fields
  require("mason-lspconfig").setup({
    ensure_installed = {
      "clangd",
      "bashls",
      "lua_ls",
      "rust_analyzer",
      "ols",
      "gopls",
      "zls",
      "matlab_ls",
      -- "jdtls",
      "pyright",
      -- "html",
      -- "cssls",
      -- "intelephense",
      -- "graphql",
    },
    automatic_installation = true,
    automatic_setup = false,
  })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "isort",
          "eslint_d",
          "markdownlint",
          "shfmt",
          "codelldb",
          "phpcbf",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
}
