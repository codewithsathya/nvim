return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function()
    local cmp = require("cmp")
    cmp.setup({
      preselect = 'item',
      completion = {
        completeopt = "menu,menuone,noinsert"
      }
    })
  end,
}
