return {
  {
    "folke/tokyonight.nvim",
    opts = function()
      return {
        style = "storm",
        transparent = true,
        styles = {
          -- sidebars = "transparent",
          floats = "transparent",
        },
        on_colors = function(colors)
          colors.border = colors.orange
        end,
      }
    end,
  },
}
