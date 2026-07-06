vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "go", "<Cmd>diffget //2<CR>", { desc = "Git diff ours" })
vim.keymap.set("n", "gt", "<Cmd>diffget //3<CR>", { desc = "Git diff theirs" })
