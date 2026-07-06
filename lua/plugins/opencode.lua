require("render-markdown").setup({
  anti_conceal = { enabled = false },
  file_types = { "opencode_output" },
})

require("opencode").setup({
  ui = {
    output = { filetype = "opencode_output", },
  },
})
