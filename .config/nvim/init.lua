-- Suppress unsupported LSP method notifications (e.g. MetaMate's textDocument/inlineCompletions)
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:find("textDocument/inlineCompletions") then
    return
  end
  original_notify(msg, level, opts)
end

-- Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    -- { "LazyVim/LazyVim", tag = "v14.15.1", import = "lazyvim.plugins" },
    { "LazyVim/LazyVim", tag = "v15.13.0", import = "lazyvim.plugins" },
    -- add Neovim@Meta and import the language service configuration
    {
      dir = "/usr/share/fb-editor-support/nvim",
      name = "meta.nvim",
      import = "meta.lazyvim",
    },
    { import = "lazyvim.plugins.extras.lsp.none-ls" },
    -- import/override with your plugins in `~/.config/nvim/lua/plugins`
    -- this can overwrite configurations from all of the above
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins
    -- will load during startup. If you know what you're doing, you can set this
    -- to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin
    -- that support versioning, have outdated releases, which may break your
    -- Neovim install.
    version = false, -- always use the latest git commit
    -- try installing the latest stable version for plugins that support semver
    -- version = "*",
    news = false, -- don't show news popup on each launch of nvim
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = false }, -- don't automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Additions from neovim@meta plugin guide: https://www.internalfb.com/wiki/Development_Environment/Neovim/Neovim@Meta_Plugin/
require("meta.lsp")
vim.lsp.enable({
  --   "rust-analyzer@meta", -- for Rust - Run `:RustAnalyzerReload` on TARGETS changes
  "fb-pyright-ls@meta", -- for Python
  "pyre@meta", -- for Python type checking
  "pyre-codenav@meta", -- for Python code navigation using Pyre
  --   "wasabi@meta", -- for [Wasabi](<https://www.internalfb.com/intern/wiki/Bento_Team/Language_Services_(LSPs)/Wasabi/>) support, a new, experimental Python LS at Meta
  "thriftlsp@meta", -- for Thrift
  "cppls@meta", -- for C++
  "buckls@meta", -- for Buck
  "buck2@meta", -- new LS for Buck/Starlark
  --   "erlang@meta", -- for Erlang in Whatsapp repos
  --   "gopls@meta", -- for Golang
  --   "eslint@meta", -- for JavaScript linting
  --   "prettier@meta", -- for JavaScript formatting
  --   "flow@meta", -- for JavaScript type checking
  "hhvm", -- for Hack
  "linttool@meta", -- for linting and formatting
  --   "sourcekit-lsp@meta", -- for Swift (experimental)
  --   "relay@meta", -- for GraphQL/relay
  --   "kotlin@meta", -- for Kotlin
})

local meta = require("meta")
local null_ls = require("null-ls")

null_ls.setup({
  on_attach = on_attach,
  sources = {
    meta.null_ls.diagnostics.arclint,
    meta.null_ls.formatting.arclint,
    meta.null_ls.diagnostics.rust_clippy,
    meta.null_ls.code_actions.dmt,
  }
})


-- Format on save
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> silent noa w | lua vim.lsp.buf.format({async=false,timeout_ms=30000})
        augroup END
        ]])
    end
end

null_ls.setup({
    on_attach = on_attach,
    sources = {
        meta.null_ls.diagnostics.arclint,
        meta.null_ls.formatting.arclint,
    }
})

require("meta.keymaps")
require("meta.cmds")

require('telescope').setup {
  -- extensions = {
  --   fzf = {
  --     fuzzy = true,                    -- false will only do exact matching
  --     override_generic_sorter = true,  -- override the generic sorter
  --     override_file_sorter = true,     -- override the file sorter
  --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  --                                      -- the default case_mode is "smart_case"
  --   }
  -- }
}
require("telescope").load_extension("myles")
require("telescope").load_extension("biggrep")
require("telescope").load_extension("hg")
-- require("telescope").load_extension("fzf")

require("meta.hg").setup({
  signs = {
    add = {
      char = "▎",
      hl = "DiagnosticSignOk",
    },
    delete = {
      char = "▎",
      hl = "DiagnosticSignError",
    },
  },
  line_blame = {
    enable = false, -- change to true if you want line blame to be displayed by default
    highlight = "Comment",
    prefix = string.rep(" ", 4),
  },
})

require('meta').setup({
  -- ... other config ...
  buck = {
    -- Buck command settings
    buck_cmd = 'buck2',                 -- Buck command (buck2 or buck)
    use_isolation_dir = false,          -- Set true if you have high contention issues
                                        -- Default false as caching can be more problematic
    isolation_dir = 'neovim',           -- Isolation directory name (when enabled)

    -- Terminal display settings
    terminal_mode = 'split',            -- 'split', 'vsplit', 'tab', or 'float'
    terminal_size = 15,                 -- Height for split, width for vsplit
    terminal_scrollback = 10000,        -- Terminal scrollback lines
    keep_focus = true,                  -- Keep focus on editor after command (recommended)
    auto_close_on_success = false,      -- Auto-close terminal on success
                                        -- Recommended: true for float mode (less intrusive)

    -- Buck command options
    buck_command_options = {
      test_args = {},                   -- Additional args for buck test
      build_args = {},                  -- Additional args for buck build
      run_args = {},                    -- Additional args for buck run
    },

    -- Visual test result indicators
    visual_indicators = {
      enabled = true,
      use_gutter = false,               -- Use sign column (gutter) instead of inline virtual text
                                        -- Gutter icons are more visible and don't shift text
      passed_icon = ' ✓',
      failed_icon = ' ✗',
      running_icon = ' ⟳',
      warning_icon = ' ⚠',
      test_marker_icon = ' 🧪',
    },

    -- Keybindings (disabled by default to avoid conflicts)
    -- Set enabled = true and optionally override specific bindings
    keybindings = {
      enabled = false,                  -- Set to true to enable keybindings
      test_current = '<leader>bt',      -- Test at cursor
      test_target = '<leader>bT',       -- Test entire target
      test_file = '<leader>bf',         -- Test entire file
      test_last = '<leader>bl',         -- Rerun last test
      build_target = '<leader>bb',      -- Build target
      run_target = '<leader>br',        -- Run target
      toggle_terminal = '<leader>bg',   -- Toggle Buck terminal (recommended for float mode)
    },
  },
})

require('meta.buck').setup()

require("meta.dmt").setup({
  keymaps = {
    -- Main window controls
    toggle = "<leader>dt",              -- [toggle] Toggle terminal visibility
    open = "<leader>do",                -- [open] Open terminal window
    close = "<leader>dc",               -- [close] Close terminal (kill process)
    hide = "<leader>dh",                -- [hide] Hide terminal window
    focus = "<leader>df",               -- [focus] Focus terminal window

    -- Send content to terminal
    send_buffer = "<leader>db",         -- [send_buffer] Send current buffer to terminal
    send_all_buffers = "<leader>dB",    -- [send_all_buffers] Send all open buffers to terminal
    send_selection = "<leader>ds",      -- [send_selection] Send visual selection to terminal
    send_prompt = "<leader>dp",         -- [send_prompt] Send custom prompt to terminal

    -- Send diagnostics to terminal
    send_diagnostics = "<leader>dd",    -- [send_diagnostics] Send current buffer diagnostics to terminal
    send_all_diagnostics = "<leader>dD",-- [send_all_diagnostics] Send all diagnostics to terminal
    send_line_diagnostics = "<leader>dl",-- [send_line_diagnostics] Send current line diagnostics to terminal

    -- Terminal mode helpers
    edit_prompt = "<C-g>e",             -- [edit_prompt] Edit prompt in buffer
    expand_last_buffer = "<C-g>b",      -- [expand_last_buffer] Insert last buffer path
    expand_all_buffers = "<C-g>B",      -- [expand_all_buffers] Insert all buffer paths
    expand_diagnostics = "<C-g>d",      -- [expand_diagnostics] Insert diagnostics text
    expand_all_diagnostics = "<C-g>D",  -- [expand_all_diagnostics] Insert all diag text
    escape_keys = "jk",                 -- [escape_keys] Quick escape from terminal mode (see below)
  },
})
