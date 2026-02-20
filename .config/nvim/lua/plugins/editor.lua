return {
  -- Disable gitsigns (git-only, doesn't work with hg/sl)
  { "lewis6991/gitsigns.nvim", enabled = false },
  -- vim-signify disabled: meta.hg provides hg/sl gutter signs natively
  { "mhinz/vim-signify", enabled = false },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            -- I don't like having to tap <Esc> twice to exit Telescope.
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    },
  },
  -- {
  --   "ojroques/nvim-osc52",
  --   config = function()
  --       require("osc52").setup {
  --           max_length = 0,    -- no limit on text length
  --           trim = false,      -- do not trim whitespace
  --           silent = false,    -- show notification on copy
  --       }
  --   end
  -- },
}
