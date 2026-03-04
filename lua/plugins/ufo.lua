---@diagnostic disable: unused-local, missing-fields
return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    --- Keymaps
    local opts = { silent = true, noremap = true, desc = "" }

    opts.desc = "Open all folds"
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, opts)

    opts.desc = "Close all folds"
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, opts)

    opts.desc = "Fold less"
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, opts)

    opts.desc = "Fold more"
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, opts)

    opts.desc = "Fold functions"
    vim.keymap.set("n", "zf", function()
      require("ufo").openFoldsExceptKinds({
        "function_definition", -- cpp
        "preproc_function_def", -- cpp
      })
    end, opts)

    opts.desc = "Fold functions and templates"
    vim.keymap.set("n", "zF", function()
      require("ufo").openFoldsExceptKinds({
        "template_declaration", -- cpp
        "function_definition", -- cpp
        "preproc_function_def", -- cpp
      })
    end, opts)

    opts.desc = "Fold specifications"
    vim.keymap.set("n", "zs", function()
      require("ufo").openFoldsExceptKinds({
        "comment", -- cpp
      })
    end, opts)

    --- Handle multi-line comments
    local fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local folded_lines = endLnum - lnum
      local suffix = ("  %d "):format(folded_lines)

      local comment_type = nil
      for i, chunk in ipairs(virtText) do
        local text = chunk[1]
        local hl_group = chunk[2] or "Normal"
        if i == #virtText then text = text:gsub("[%s]*%{$", "") end
        table.insert(newVirtText, { text, hl_group })
        if text:match("^%s*/%*") then
          comment_type = "slash_star"
        elseif text:match("^%s*///") then
          comment_type = "slash_slash_slash"
        end
      end

      if comment_type == "slash_star" then
        local second_line = ""
        local second_line_content = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, false)

        if second_line_content[1] then
          second_line = second_line_content[1]
              :gsub("^%s*%*%s?", "")
              :gsub("^%s+", "")
        end

        table.insert(newVirtText, { " " .. second_line, "Comment" })
      end

      table.insert(newVirtText, { suffix, "Comment" })
      return newVirtText
    end

    --- Setup
    require("ufo").setup({
      open_fold_hl_timeout = 0,
      provider_selector = function() return { "treesitter", "indent" } end,
      fold_virt_text_handler = fold_virt_text_handler,
    })
  end,
}
