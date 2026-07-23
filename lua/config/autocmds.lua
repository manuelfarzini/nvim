-- TODO: to be refactored

-- Highligh on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Yank highlight",
  pattern = "*",
  group = vim.api.nvim_create_augroup("YankHiglight", { clear = true }),
  callback = function() vim.highlight.on_yank({
    timeout = 40,
    higroup = "IncSearch",
  }) end,
})
--

-- Match brackets
vim.api.nvim_create_augroup("MatchBrackets", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "MatchBrackets",
  pattern = { "cpp", "html", "xml", "java" },
  callback = function() vim.opt_local.matchpairs:append("<:>") end,
})
--

-- Setup repo
vim.api.nvim_create_user_command("Setup", function()
    vim.env.GIT_DIR = vim.fn.expand("~/.setup")
    vim.env.GIT_WORK_TREE = vim.fn.expand("~")
    vim.cmd.edit()
end, {})
--
