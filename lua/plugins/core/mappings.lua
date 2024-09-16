---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["J"] = { "5j", desc = "5 lines down"},
        ["K"] = { "5k", desc = "5 lines up"},
        ["<Leader>rr"] = { ":CompetiTest<space>run<cr>", desc = "Run competitest" },
        ["<Leader>rc"] = { ":CompetiTest<space>receive<space>contest<cr>", desc = "Receive contest competitest" },
        ["<Leader>rt"] = { ":CompetiTest<space>receive<space>testcases<cr>", desc = "Receive testcases competitest" },
        ["<Leader>rp"] = { ":CompetiTest<space>receive<space>problem<cr>", desc = "Receive problem competitest" },
      },
      v = {
        ["J"] = { "5j", desc = "5 lines down"},
        ["K"] = { "5k", desc = "5 lines up"},
      },
    },

  }
}
