-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- map arrow keys to pane shifts.
map("n", "<Up>", "<C-w><C-k>", { noremap = true })
map("n", "<Down>", "<C-w><C-j>", { noremap = true })
map("n", "<Left>", "<C-w><C-h>", { noremap = true })
map("n", "<Right>", "<C-w><C-l>", { noremap = true })

-- avoid mistyping write/quit
cmd("command WQ wq")
cmd("command Wq wq")
cmd("command W w")
cmd("command Q q")

-- using Meta/Alt can result in <Esc> being interpreted as Meta/Alt, which makes
-- for odd behaviors when quickly pressing <Esc> sometimes, so disable Meta
-- chords.
-- https://github.com/neovim/neovim/issues/20064
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

-- Normal mode mappings
-- vim.keymap.set('n', 'H', '^', { noremap = true, silent = true })
-- vim.keymap.set('n', 'L', '$', { noremap = true, silent = true })
-- -- Insert mode mappings
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })

vim.g.ranger_command_override = 'ranger --cmd "set show_hidden=true"'

-- Dashboard
vim.keymap.set("n", "<leader>;", function()
  Snacks.dashboard()
end, { desc = "Dashboard" })

-- Session management
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").select()
end, { desc = "Select session" })

vim.keymap.set("n", "<leader>qS", function()
  require("persistence").save()
  vim.notify("Session saved for: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~"), vim.log.levels.INFO)
end, { desc = "Save session" })

vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load()
end, { desc = "Load session (cwd)" })

vim.keymap.set("n", "<leader>qL", function()
  require("persistence").load({ last = true })
end, { desc = "Load last session" })

vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
  vim.notify("Session auto-save stopped", vim.log.levels.INFO)
end, { desc = "Stop session auto-save" })

vim.keymap.set("n", "<leader>qx", function()
  local sessions = require("persistence").list()
  local dir = vim.fn.fnamemodify(require("persistence.config").options.dir, ":p")
  local items = {}
  for _, session in ipairs(sessions) do
    local name = session:sub(#dir + 1, -5):gsub("%%", "/")
    items[#items + 1] = { path = session, name = name }
  end

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers.new({}, {
    prompt_title = "Delete Sessions (Tab to select, Enter to delete)",
    finder = finders.new_table({
      results = items,
      entry_maker = function(item)
        return {
          value = item,
          display = item.name,
          ordinal = item.name,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selected = picker:get_multi_selection()
        if #selected == 0 then
          local entry = action_state.get_selected_entry()
          if entry then
            selected = { entry }
          end
        end
        actions.close(prompt_bufnr)
        for _, entry in ipairs(selected) do
          os.remove(entry.value.path)
        end
        vim.notify("Deleted " .. #selected .. " session(s)", vim.log.levels.INFO)
      end)
      return true
    end,
  }):find()
end, { desc = "Delete session(s)" })

