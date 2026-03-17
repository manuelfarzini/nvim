--------------- Miscellaneous --------------

--- Center search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "No highlight" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

--- Center scroll
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "Jump down half page" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "Jump up half page" })

--- Select
vim.keymap.set("n", "gp", "`[v`]", { noremap = true, desc = "Select last pasted" })
vim.keymap.set("n", "<leader><leader>a", "ggVG", { desc = "Select all" })

--- Jumplist
vim.keymap.set("n", "<C-i>", "<C-o>")
vim.keymap.set("n", "<C-o>", "<C-i>")

--- Diagnostics
vim.keymap.set("n", "<leader>td", "<cmd>lua toggle_diagnostics()<CR>", { desc = "Toggle diagnostics" })

--- Markview
vim.keymap.set("n", "<leader>tmv", "<cmd>Markview toggle<CR>", { desc = "Toggle Markview" })

--- Replace
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

--- Commandline scroll
vim.keymap.set("c", "<M-j>", "<Down>", { noremap = true })
vim.keymap.set("c", "<M-k>", "<Up>", { noremap = true })


--------------- Splits ---------------------

--- Create splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split horizzontally" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })

--- Move cursor trough splits
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to split above" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to split below" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

--- Resize splits
vim.keymap.set("n", "<M-S-h>", ":vertical resize -2<CR>", { desc = "Resize left" })
vim.keymap.set("n", "<M-S-j>", ":resize -2<CR>", { desc = "Resize down" })
vim.keymap.set("n", "<M-S-k>", ":resize +2<CR>", { desc = "Resize up" })
vim.keymap.set("n", "<M-S-l>", ":vertical resize +2<CR>", { desc = "Resize right" })
vim.keymap.set("n", "<M-e>", "<C-w>=", { desc = "Equalize split sizes" })

--- Splits layout
vim.keymap.set("n", "<leader>sH", "<C-w>k<C-w>K", { desc = "Change split view to hori" })
vim.keymap.set("n", "<leader>sV", "<C-w>k<C-w>H", { desc = "Change split view to vert" })

--- Close splits
vim.keymap.set("n", "<M-c>", "<C-w>c", { desc = "Close current split" })


--------------- Yank | Delete --------------

vim.keymap.set("n", "Y", "y$", { desc = "Yank to the end of line" })

vim.keymap.set("n", "<leader>y", [["+y]], { desc = "Yank to +" }) -- NOTE: ovverides " and 0

local function yank_to_plus__preserve_quote_and_zero__visual() -- NOTE: preserve " and 0
  local reg_quote = vim.fn.getreg('"')
  local type_quote = vim.fn.getregtype('"')
  local reg0 = vim.fn.getreg("0")
  local type0 = vim.fn.getregtype("0")
  vim.cmd([[normal! "+y]])
  vim.fn.setreg('"', reg_quote, type_quote)
  vim.fn.setreg("0", reg0, type0)
end
vim.keymap.set("v", "<leader>y", yank_to_plus__preserve_quote_and_zero__visual, { desc = "Yank to +" })

-- XXX: should I make a delete to + ?
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete to _" })

----------------- Terminal -----------------

vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("split | terminal")
  vim.cmd("startinsert")
end, { silent = true, noremap = true })

--------------- Snippets -------------------

vim.keymap.set(
    "n",
    "<leader>is",
    "o**/<Esc>O/**<Esc>jO<Tab>",
    { silent = true, noremap = true, desc = "Insert spec" }
)




