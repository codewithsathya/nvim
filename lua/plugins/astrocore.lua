---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 },
            autopairs = true,
            cmp = true,
            diagnostics = { virtual_text = false, virtual_lines = false },
            highlighturl = true,
            notifications = false
        },
        diagnostics = {
            virtual_text = false,
            underline = true,
        },
        options = {
            opt = {
                relativenumber = true,
                number = true,
                spell = false,
                signcolumn = "yes",
                wrap = false,
                tabstop = 4,
                shiftwidth = 4,
                expandtab = true,
            },
        },
    },
}
