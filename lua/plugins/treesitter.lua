return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" },

    config = function()
      -- mojo
      vim.filetype.add({
        extension = { mojo = "mojo" },
      })
      local function add_mojo_parser()
        require("nvim-treesitter.parsers").mojo = {
          install_info = {
            url = "https://github.com/lsh/tree-sitter-mojo",
            branch = "main",
          },
        }
      end
      add_mojo_parser()
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = add_mojo_parser,
      })
      --

      local ts = require("nvim-treesitter")

      ts.setup({})

      ts.install({
        "c",
        "cpp",
        "faust",
        "lua",
        "mojo",
        "rust",
        "matlab",
        "go",
        "markdown",
        "markdown_inline",
        "zig",
        "vim",
        "python",
        "java",
        "yaml",
        "toml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "faust",
          "lua",
          "mojo",
          "rust",
          "matlab",
          "go",
          "markdown",
          "markdown_inline",
          "zig",
          "vim",
          "python",
          "java",
          "yaml",
          "toml",
        },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
