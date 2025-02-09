lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright" },
})

local lspconfig = require("lspconfig")

-- Setup Python LSP (Pyright)
lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",  -- Analyze only open files, not the whole project
        useLibraryCodeForTypes = true,
      },
    },
  },
})

-- Keybindings for LSP Features
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
EOF
