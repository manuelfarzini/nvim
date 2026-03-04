--------------------------------------------
-- Rename under cursor

local function esc_search_pat_ident(s)
  return s:gsub("\\", "\\\\")
end

local function esc_sub_repl(s)
  s = s:gsub("\\", "\\\\")
  s = s:gsub("&", "\\&")
  s = s:gsub("/", "\\/")
  return s
end

local function rename_cword_qf(opts)
  opts = opts or {}

  -- grep under cursor
  local old = vim.fn.expand("<cword>")
  if old == "" then return end

  -- get new name
  local new = vim.fn.input(("Rename '%s' to: "):format(old), old)
  if new == "" or new == old then return end

  -- vim regex
  local pat = "\\C\\<" .. esc_search_pat_ident(old) .. "\\>"

  local glob = opts.glob or "**/*"

  -- populate quickfix
  vim.cmd(("silent! vimgrep /%s/gj %s"):format(pat, glob))

  -- note: if hidden=false, :cdo may stop when buffers become modified
  local old_hidden = vim.o.hidden
  vim.o.hidden = true

  vim.cmd("copen")

  local flags = "g" .. ((opts.confirm == false) and "" or "c")
  vim.cmd(("silent! cdo %%s/%s/%s/%s"):format(pat, esc_sub_repl(new), flags))

  if opts.save then
    vim.cmd("silent! cfdo update")
  end

  vim.o.hidden = old_hidden
end

vim.keymap.set("n", "<leader>RW", function()
  rename_cword_qf({
    glob = "**/*.{c,cc,cpp,cxx,h,hh,hpp,hxx,inl,inc}",
    confirm = true,
    save = false,
  })
end, { desc = "Rename word across cwd files via quickfix" })

