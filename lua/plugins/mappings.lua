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
                ["<Leader>bd"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr) require("astrocore.buffer").close(bufnr) end
                        )
                    end,
                    desc = "Close buffer from tabline",
                },
            },
            v = {
                ["J"] = { "5j", desc = "5 lines down"},
                ["K"] = { "5k", desc = "5 lines up"},
            },
        },
    },
}
