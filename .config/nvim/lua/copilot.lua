-- use this table to disable/enable filetypes for copilot
vim.g.copilot_disabled_filetypes = { xml = false, java = false, markdown=false }

-- vim.g.copilot_disabled_filetypes = { ["*"] =false, python=true}

vim.cmd[[imap <silent><script><expr> <C-a> copliot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

