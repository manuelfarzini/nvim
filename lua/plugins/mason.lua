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

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls", "lua_ls", "rust_analyzer", "ols", "gopls", "zls", "matlab_ls", "pyright",
  },
  automatic_installation = true,
  automatic_setup = false,
})

require("mason-tool-installer").setup({
  ensure_installed = { "isort", "markdownlint", "phpcbf", "prettier", "stylua", "codelldb" },
  auto_update = true,
  run_on_start = true,
})
