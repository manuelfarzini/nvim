return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = {
      char = "┊", -- char = "\u{250A}",
      highlight = { "IndentLineColor" },
      priority = 100,
    },
    scope = {
      enabled = true,
      highlight = { "IndentScopeLineColor" },
      show_start = false,
      show_end = false,
      show_exact_scope = false,
    },
  },
}
