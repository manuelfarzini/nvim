vim.cmd.packadd("nvim.undotree")

vim.keymap.set("n", "<leader>ut", "<Cmd>Undotree<CR>", {
  desc = "Undo tree",
})
