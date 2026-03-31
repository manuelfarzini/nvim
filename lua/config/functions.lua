------------------------------------------++
--+ Rename under cursor
------------------------------------------++

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

------------------------------------------++
--+ Yank diagnostic under cursors
------------------------------------------++

local function yank_diagnostic_under_cursor_to_plus()
    local bufnr = 0
    local pos = vim.api.nvim_win_get_cursor(0)
    local line = pos[1] - 1
    local col = pos[2]

    local diags = vim.diagnostic.get(bufnr)
    local picked = nil

    for _, d in ipairs(diags) do
        local start_line = d.lnum
        local end_line = d.end_lnum or d.lnum
        local start_col = d.col or 0
        local end_col = d.end_col or start_col

        local on_same_line = (line >= start_line and line <= end_line)
        local in_cols = true

        if start_line == end_line and line == start_line then
            in_cols = (col >= start_col and col <= end_col)
        elseif line == start_line then
            in_cols = (col >= start_col)
        elseif line == end_line then
            in_cols = (col <= end_col)
        end

        if on_same_line and in_cols then
            picked = d
            break
        end
    end

    if not picked then
        vim.notify("No diagnostic under cursor", vim.log.levels.WARN)
        return
    end

    local msg = picked.message
    if picked.code then
        msg = msg .. " [" .. tostring(picked.code) .. "]"
    end

    vim.fn.setreg("+", msg)
    vim.fn.setreg("*", msg)

    vim.notify("Diagnostic copied to clipboard")
end

vim.keymap.set("n", "<leader>yd", yank_diagnostic_under_cursor_to_plus, {
    desc = "Yank diagnostic under cursor to +",
    silent = true,
})
