require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.refactor")
require("plugins.visualmulti")

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },

  { src = "https://github.com/stevearc/dressing.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  -- { "https://github.com/uga-rosa/ccc.nvim" },

  { src = "https://github.com/folke/flash.nvim" },
  { src = "https://github.com/numToStr/Comment.nvim" },
  { src = "https://github.com/kylechui/nvim-surround" },
  { src = "https://github.com/gbprod/substitute.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", },
  { src = "https://github.com/szw/vim-maximizer" },
  { src = "https://github.com/mg979/vim-visual-multi" },

  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/kevinhwang91/nvim-hlslens" },

  { src = "https://github.com/nvim-telescope/telescope.nvim" },

  { src = "https://github.com/nvim-tree/nvim-tree.lua" },

  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },

  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/hrsh7th/cmp-cmdline" },

  { src = "https://github.com/chrisgrieser/nvim-origami" },
  -- { src = "https://github.com/kevinhwang91/promise-async" },
  -- { src = "https://github.com/kevinhwang91/nvim-ufo" },

  { src = "https://github.com/tpope/vim-fugitive" },

  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },

  { src = "https://github.com/monkoose/neocodeium" },

  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/sudo-tee/opencode.nvim" },
})

vim.cmd.colorscheme("theme")

require("plugins.undotree")

require("plugins.dressing")
require("plugins.whichkey")
require("plugins.lualine")
require("plugins.blankline")
-- require("plugins.ccc")

require("plugins.flash")
require("plugins.comment")
require("plugins.surround")
require("plugins.substitute")
require("plugins.harpoon")
require("plugins.maximizer")

require("plugins.todos")
require("plugins.hlslens")
require("plugins.telescope")

require("plugins.tree")

require("plugins.treesitter")

require("plugins.mason")
require("plugins.lsp")
require("plugins.conform")
require("plugins.cmp")

require("plugins.origami")
-- require("plugins.ufo")

require("plugins.fugitive")

require("plugins.dap")

require("plugins.neocodeium")
require("plugins.opencode")
