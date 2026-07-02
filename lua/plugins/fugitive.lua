vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

-- local manoj_fugitive = vim.api.nvim_create_augroup("manoj_fugitive", {})
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("BufWinEnter", {
--   group = manoj_fugitive,
--   pattern = "*",
--   callback = function()
--     if vim.bo.ft ~= "fugitive" then return end
--     local bufnr = vim.api.nvim_get_current_buf()
--     -- TODO: more mnemonic keybind
--     desc = "Git push origin.."
--     vim.keymap.set("n", "<leader>t", ":Git push -u origin ", {
--       buffer = bufnr,
--       remap = false,
--       desc = desc,
--     })
--   end,
-- })

vim.keymap.set("n", "go", "<Cmd>diffget //2<CR>", { desc = "Git diff ours" })
vim.keymap.set("n", "gt", "<Cmd>diffget //3<CR>", { desc = "Git diff theirs" })
