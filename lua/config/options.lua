-- General
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.cmdheight = 0
vim.opt.laststatus = 2
vim.cmd("let g:netrw_liststyle = 3")
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.g.have_nerd_font = false
vim.lsp.log.set_level("OFF")
--

-- Miscellaneous
vim.opt.list = false
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.inccommand = "split"
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
--

-- Visual settings
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
--

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
--

-- Editor
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
local function set_tab_size(lang, tabstop, shiftwidth)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    callback = function()
      vim.opt.tabstop = tabstop
      vim.opt.shiftwidth = shiftwidth
    end,
  })
end
set_tab_size("c", 2, 2)
set_tab_size("cpp", 4, 4)
set_tab_size("java", 2, 2)
set_tab_size("lua", 2, 2)
set_tab_size("sh", 2, 2)
set_tab_size("json", 2, 2)
set_tab_size("zig", 4, 4)
set_tab_size("go", 2, 2)
set_tab_size("html", 2, 2)
set_tab_size("css", 2, 2)
set_tab_size("c3", 4, 4)
set_tab_size("py", 2, 2)
set_tab_size("scm", 2, 2)
set_tab_size("mojo", 4, 4)
set_tab_size("scm", 2, 2)
--

-- Hover
vim.o.winborder = "rounded"
--

-- Cursor
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

-- Restore settings
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir/")
vim.opt.undolevels = 400
vim.opt.swapfile = false
--

-- Backspace
vim.opt.backspace = "indent,eol,start"
--

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
--

-- Timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300
--

-- Disable plugin settings
vim.fn.sign_unplace("UfoPreviewCursorLine")
--

-- Diagnostics
vim.diagnostic.config({
  float = { header = "", prefix = "", suffix = "",
            max_width = math.floor(vim.o.columns * 0.8), max_height = math.floor(vim.o.lines * 0.4),
            format = function(diagnostic) return string.format(" %s \n", diagnostic.message) end, },
})
--
