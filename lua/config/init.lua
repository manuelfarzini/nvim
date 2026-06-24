require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.functions")
require("config.pack")

vim.cmd.colorscheme("theme")

-- UI
require("plugins.dressing")
require("plugins.whichkey")
require("plugins.lualine")
require("plugins.blankline")
require("plugins.ccc")

-- Navigation / editing
require("plugins.flash")
require("ts_context_commentstring.integrations.comment_nvim")
require("plugins.comment")
require("plugins.surround")
require("plugins.substitute")
require("plugins.harpoon")
require("plugins.maximizer")
require("plugins.visualmulti")

-- Search / diagnostics / lists
require("plugins.todos")
require("plugins.hlslens")
require("plugins.telescope")

-- File tree
require("plugins.tree")

-- Syntax
require("plugins.treesitter")

-- LSP / tooling
require("plugins.mason")
require("plugins.lsp")
require("plugins.conform")
require("plugins.cmp")

-- Folding
require("plugins.ufo")

-- Git
require("plugins.fugitive")

-- Debugging
require("plugins.dap")

-- Misc
require("plugins.undotree")
require("plugins.neocodeium")
require("plugins.opencode")
