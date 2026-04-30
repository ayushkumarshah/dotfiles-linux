-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:find("textDocument/inlineCompletions") then
    return
  end
  original_notify(msg, level, opts)
end

-- Auto-reload files changed externally (e.g. by Claude Code)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})
