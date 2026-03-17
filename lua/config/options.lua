---@diagnostic disable: undefined-global
--- General
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.cmdheight = 0
vim.opt.laststatus = 2
vim.cmd("let g:netrw_liststyle = 3")
vim.lsp.set_log_level("off") -- "Debug" if needed
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.g.have_nerd_font = false
--

--- Miscellaneous
vim.opt.list = false
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.inccommand = "split"
--

--- Visual settings
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
--

--- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
--

--- Editor
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.formatoptions:remove("o")
vim.o.textwidth = 110
vim.o.wrapmargin = 110
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.o.linebreak = false
vim.opt.guicursor = ""
-- Language specific
local function set_indent(lang, tabstop, shiftwidth)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    callback = function()
      vim.opt.tabstop = tabstop
      vim.opt.shiftwidth = shiftwidth
    end,
  })
end
set_indent("c", 2, 2)
set_indent("cpp", 4, 4)
set_indent("java", 2, 2)
set_indent("lua", 2, 2)
set_indent("sh", 2, 2)
set_indent("json", 2, 2)
set_indent("zig", 4, 4)
set_indent("go", 2, 2)
set_indent("html", 2, 2)
set_indent("css", 2, 2)
set_indent("c3", 4, 4)
set_indent("py", 2, 2)
set_indent("scm", 2, 2)
set_indent("mojo", 4, 4)
set_indent("scm", 2, 2)
--

--- Hover
vim.o.winborder = "rounded"
--

--- Cursor
---@diagnostic disable-next-line: missing-fields
vim.opt.guicursor = table.concat({
  "n-v-c:block",
  "i-ci:ver25",
  "t:ver25",
  "r-cr:hor20",
  "o:hor50",
  "sm:block",
  "a:blinkwait0-blinkoff0-blinkon0",
}, ",")
--

--- Restore settings
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir/")
vim.opt.undolevels = 400
vim.opt.swapfile = false
--

--- Backspace
vim.opt.backspace = "indent,eol,start"
--

--- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
--

--- Timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300
--

--- Fillchars
---@diagnostic disable-next-line: missing-fields
vim.opt.fillchars = {
  vert = "│",
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
}

--- Disable some plugin settings
vim.fn.sign_unplace("UfoPreviewCursorLine")
--
