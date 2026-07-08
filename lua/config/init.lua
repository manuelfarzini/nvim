-- Configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.functions")
require("plugins.visualmulti")

vim.pack.add({
  -- Core dependencies
  "https://github.com/nvim-lua/plenary.nvim",

  -- UI
  "https://github.com/stevearc/dressing.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  -- "https://github.com/uga-rosa/ccc.nvim",

  -- Navigation / editing
  "https://github.com/folke/flash.nvim",
  "https://github.com/numToStr/Comment.nvim",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/gbprod/substitute.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", },
  "https://github.com/szw/vim-maximizer",
  "https://github.com/mg979/vim-visual-multi",

  -- Search / diagnostics / lists
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/kevinhwang91/nvim-hlslens",

  -- Telescope ecosystem
  "https://github.com/nvim-telescope/telescope.nvim",

  -- File tree
  "https://github.com/nvim-tree/nvim-tree.lua",

  -- Treesitter
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/nvim-treesitter/nvim-treesitter",

  -- LSP / tooling
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/stevearc/conform.nvim",

  -- Completion
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-cmdline",

  -- Folding
  "https://github.com/kevinhwang91/promise-async",
  "https://github.com/kevinhwang91/nvim-ufo",

  -- Git
  "https://github.com/tpope/vim-fugitive",

  -- Debugging
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",

  -- Misc
  "https://github.com/monkoose/neocodeium",

  -- Opencode
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/sudo-tee/opencode.nvim",
})

vim.cmd.colorscheme("theme")

-- Undotree
require("plugins.undotree")

-- UI
require("plugins.dressing")
require("plugins.whichkey")
require("plugins.lualine")
require("plugins.blankline")
-- require("plugins.ccc")

-- Navigation / editing
require("plugins.flash")
require("plugins.comment")
require("plugins.surround")
require("plugins.substitute")
require("plugins.harpoon")
require("plugins.maximizer")

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
require("plugins.neocodeium")
require("plugins.opencode")
