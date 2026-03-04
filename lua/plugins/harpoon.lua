return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    ----- Telescope ------------

    local tele_config = require("telescope.config").values
    local tele_pickers = require("telescope.pickers")
    local tele_finders = require("telescope.finders")
    local tele_state = require("telescope.actions.state")

    local function toggle_telescope(hlist)

      local function make_results()
        local results = {}
        for i, item in ipairs(hlist.items) do
          if item and item.value and item.value ~= "" then
            table.insert(results, { idx = i, path = item.value })
          end
        end
        return results
      end

      tele_pickers.new({}, {
        prompt_title = "Harpoon",
        finder = tele_finders.new_table({
          results = make_results(),
          entry_maker = function(e)
            return {
              value = e,
              ordinal = e.path,
              display = e.path,
              path = e.path,
            }
          end,
        }),
        previewer = tele_config.file_previewer({}),
        sorter = tele_config.generic_sorter({}),

        attach_mappings = function(prompt_bufnr, map)
          local function refresh()
            local picker = tele_state.get_current_picker(prompt_bufnr)
            picker:refresh(
              tele_finders.new_table({
                results = make_results(),
                entry_maker = function(e)
                  return {
                    value = e,
                    ordinal = e.path,
                    display = e.path,
                    path = e.path,
                  }
                end,
              }),
              { reset_prompt = false }
            )
          end

          map({ "i", "n" }, "<M-c>", function()
            local sel = tele_state.get_selected_entry()
            if sel and sel.value and sel.value.idx then
              hlist:remove_at(sel.value.idx)
              refresh()
            end
          end)

          return true
        end,
      }):find()
    end

    ----- Keymaps --------------

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon 5" })
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon next" })
    vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon toggle" })
  end,
}
