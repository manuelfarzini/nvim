-- stylua: ignore start

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

-- bash
vim.filetype.add({
  extension = { sh = "bash", },
})

local ts = require("nvim-treesitter")

ts.setup({})

require("nvim-ts-autotag").setup()

ts.install({ "bash", "c", "cpp", "faust", "go", "java", "lua", "matlab", "mojo", "markdown", "markdown_inline",
             "python", "rust", "toml", "vim", "yaml", "zig", })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "bash", "c", "cpp", "faust", "go", "java", "lua", "matlab", "mojo", "markdown", "markdown_inline",
              "python", "rust", "toml", "vim", "yaml", "zig", },
  callback = function() vim.treesitter.start() end,
})

-- stylua: ignore end
