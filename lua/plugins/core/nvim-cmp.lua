return {
  "hrsh7th/nvim-cmp",
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
