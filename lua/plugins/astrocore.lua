---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics = { virtual_text = false, virtual_lines = false }, -- diagnostic settings on startup
            highlighturl = true, -- highlight URLs at start
            notifications = false, -- enable notifications at start
        },
        diagnostics = {
            virtual_text = false,
            underline = true,
        },
        options = {
            opt = { -- vim.opt.<key>
                relativenumber = true, -- sets vim.opt.relativenumber
                number = true, -- sets vim.opt.number
                spell = false, -- sets vim.opt.spell
                signcolumn = "yes", -- sets vim.opt.signcolumn to yes
                wrap = false, -- sets vim.opt.wrap
            },
        },
    },
}
