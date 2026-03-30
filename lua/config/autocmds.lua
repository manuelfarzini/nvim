--- Highligh on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highl yanked text",
  group = vim.api.nvim_create_augroup("YankHiglight", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
--

--- Diagnostics snoozing
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  update_in_insert = false,
})
local diagnostics_active = true
-- toggle function
function _G.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end
-- autocmd: prevent diagnostics from showing automatically
vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
  callback = function()
    if not diagnostics_active then vim.diagnostic.hide() end
  end,
})
-- tweak vim.diagnostic.show to reflect active flag
local original_diagnostic_show = vim.diagnostic.show
vim.diagnostic.show = function(bufnr, namespace, diagnostics, opts)
  if diagnostics_active then original_diagnostic_show(bufnr, namespace, diagnostics, opts) end
end
--

--- Match brackets
vim.api.nvim_create_augroup("MatchBrackets", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "MatchBrackets",
  pattern = { "cpp", "html", "xml", "java" },
  callback = function() vim.opt_local.matchpairs:append("<:>") end,
})

--- Setup repo
vim.api.nvim_create_user_command("Setup", function()
    vim.env.GIT_DIR = vim.fn.expand("~/.setup")
    vim.env.GIT_WORK_TREE = vim.fn.expand("~")
    vim.cmd.edit()
end, {})
