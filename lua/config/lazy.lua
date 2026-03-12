---@diagnostic disable: undefined-global
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "folke/lazy.nvim", version = false },

    -- load your theme first
    {
      dir = vim.fn.stdpath("config") .. "/lua/theme",
      name = "local-theme",
      lazy = false,
      priority = 1000,
      config = function()
        vim.o.termguicolors = true
        require("theme").setup()
        vim.g.colors_name = "theme"
      end,
    },

    { import = "plugins" },
  },

  checker = { enabled = true, notify = false },
  change_detection = { notify = false },

  ui = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    size = { width = 0.85, height = 0.95 },
    backdrop = 100,
  },
})
