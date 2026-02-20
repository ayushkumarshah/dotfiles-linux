return {
  {
  "kelly-lin/ranger.nvim",
  config = function()
    require("ranger-nvim").setup({ replace_netrw = true })
    vim.api.nvim_set_keymap("n", "<leader>r", "", {
      noremap = true,
      callback = function()
        require("ranger-nvim").open(true)
      end,
    })
  end,
  },
 -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        replace_netrw = false,
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    }
  },
}
--
--   {
--   -- Main plugin
--   {
--     "francoiscabrol/ranger.vim",
--     dependencies = {
--       "rbgrouleff/bclose.vim", -- Required for Neovim
--     },
--     -- Optionally, you can set lazy loading or config here
--     -- event = "VeryLazy", -- Uncomment to lazy load
--   },
-- }
