vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require("origami").setup({
  foldtext = {
    lineCount = {
      template = "…%d",
    },
  },
})

local folds = require("config.folds")

vim.keymap.set("n", "<CR>", "za", { silent = true })
vim.keymap.set("n", "[[", folds.goto_previous_fold, { silent = true })
vim.keymap.set("n", "]]", "zj", { silent = true })

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "LspAttach" }, {
  callback = function(opts) folds.update_ranges(opts.buf) end,
})

vim.api.nvim_create_autocmd({ "BufUnload", "BufWipeout" }, {
  callback = function(opts) folds.clear(opts.buf) end,
})
