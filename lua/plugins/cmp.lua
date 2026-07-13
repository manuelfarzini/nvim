local cmp = require("cmp")

cmp.setup({
  window = {
    completion = cmp.config.window.bordered({ border = "rounded" }),
    documentation = cmp.config.window.bordered({ border = "rounded" }),
  },
  completion = { completeopt = "menu,menuone,noselect", },
  snippet = { expand = function(_) end, },
  mapping = cmp.mapping.preset.insert({
    ["<M-k>"] = cmp.mapping.select_prev_item(),
    ["<M-j>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<M-Space>"] = cmp.mapping(
      function()
        if cmp.visible() then cmp.abort()
        else cmp.complete() end
      end),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }),
})

cmp.setup.cmdline(":", {
  completion = { autocomplete = false, },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = "path" }, },
    { { name = "cmdline" }, }
  ),
})

cmp.setup.cmdline({ "/", "?" }, {
  completion = { autocomplete = false, },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
