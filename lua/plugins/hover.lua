return {
  "lewis6991/hover.nvim",
  lazy = true,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = { opt = { mousemoveevent = true } },
        mappings = {
          n = {
            ["<MouseMove>"] = { function() require("hover").hover_mouse() end, desc = "Hover mouse" },
          },
        },
      },
    },
    {
      "AstroNvim/astrolsp",
      opts = { mappings = { n = { K = false } } },
    },
  },
  opts = {
    init = function() require "hover.providers.lsp" end,
  },
}
