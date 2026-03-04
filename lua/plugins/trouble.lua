return {
  "folke/trouble.nvim",
  dependencies = { "folke/todo-comments.nvim" },
  opts = {
    icons = {
      folder_closed = "-",
      folder_open = ".",
      kinds = false,
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<Cmd>Trouble diagnostics toggle<CR>",
      desc = "Trouble diagnostics list",
    },
    {
      "<leader>xX",
      "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Trouble diagnostic sbuffer",
    },
    {
      "<leader>xs",
      "<Cmd>Trouble symbols toggle focus=false<CR>",
      desc = "symbols",
    },
    {
      "<leader>xl",
      "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>",
      desc = "Trouble LSP info",
    },
    {
      "<leader>xL",
      "<Cmd>Trouble loclist toggle<CR>",
      desc = "Trouble location list",
    },
    {
      "<leader>xQ",
      "<Cmd>Trouble qflist toggle<CR>",
      desc = "Trouble quickfix list",
    },
  },
}
