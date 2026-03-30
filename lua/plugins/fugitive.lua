return {
  "tpope/vim-fugitive",
  config = function()
    local desc = ""

    desc = "Git status"
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = desc })

    local manoj_fugitive = vim.api.nvim_create_augroup("manoj_fugitive", {})
    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = manoj_fugitive,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then return end
        local bufnr = vim.api.nvim_get_current_buf()
        -- TODO: more mnemonic keybind
        desc = "Git push origin.."
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", {
          buffer = bufnr,
          remap = false,
          desc = desc,
        })
        -- vim.keymap.set("n", "<leader>p", function()
        --     vim.cmd.Git('push')
        -- end, opts)
        --
        -- vim.keymap.set("n", "<leader>P", function()
        --     vim.cmd.Git({'pull',  '--rebase'})
        -- end, opts)
      end,
    })

    desc = "Git diff ours"
    vim.keymap.set("n", "go", "<Cmd>diffget //2<CR>", { desc = desc })
    desc = "Git diff theirs"
    vim.keymap.set("n", "gt", "<Cmd>diffget //3<CR>", { desc = desc })
  end,
}
