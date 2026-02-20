return {
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = function()
      return {
        { "<leader>bq", "<Cmd>BufferLinePickClose<CR>" },
        { "<leader>bn", "<Cmd>BufferLineCycleNext<CR>" },
        { "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>" },
      }
    end,
    opts = {
      options = {
        separator_style = "slant",
        always_show_bufferline = true,
      },
      highlights = {
        fill = {
          bg = {
            attribute = "bg",
            highlight = "StatusLine",
          },
        },
        separator = {
          fg = {
            attribute = "bg",
            highlight = "StatusLine",
          },
        },
        separator_selected = {
          fg = {
            attribute = "bg",
            highlight = "StatusLine",
          },
        },
        separator_visible = {
          fg = {
            attribute = "bg",
            highlight = "StatusLine",
          },
        },
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>uh",
        function()
          require("telescope").load_extension("notify")
          require("telescope").extensions.notify.notify()
        end,
        desc = "View messages history",
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "S", desc = "Select Session", action = ":lua require('persistence').select()" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            icon = " ",
            title = "Sessions",
            section = "projects",
            padding = 1,
            indent = 2,
            limit = 15,
            dirs = function()
              local config = require("persistence.config")
              local dir = vim.fn.fnamemodify(config.options.dir, ":p")
              local dirs = {}
              for _, session in ipairs(require("persistence").list()) do
                local name = session:sub(#dir + 1, -5):gsub("%%", "/")
                dirs[#dirs + 1] = name
              end
              return dirs
            end,
          },
          { section = "startup" },
        },
      },
    },
  },
}
