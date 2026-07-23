vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = "0"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

require("origami").setup({
  foldtext = {
    lineCount = {
      template = "…%d",
      hlgroup = "PreProc",
    },
    padding = { width = 1, },
  },
  pauseFoldsOnSearch = false,
})

vim.keymap.set("n", "[[", "zk", { silent = true })
vim.keymap.set("n", "]]", "zj", { silent = true })
